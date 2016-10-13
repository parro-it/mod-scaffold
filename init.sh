export current_year=`date +"%Y"`
export package_author=$1
export package_name=$2
export package_author_name=`npm config get init-author-name`
export package_author_email=`npm config get init-author-email`
export package_var=`echo $package_name | sed -r 's/([a-z]+)-([a-z])?([a-z]*)-?([a-z])?([a-z]*)-?([a-z])?([a-z]*)/\1\U\2\L\3\U\4\L\5\U\6\L\7/'`
echo -n "Package description: " && read package_description
export package_description

echo scaffolding $package_name

# create repo on github
gh re --no-browser --new $package_name --user $package_author --description "$package_description"

# clone from author template repo
git clone https://github.com/$package_author/template.git $package_name

cd $package_name

# change origin remote url
git remote set-url origin https://github.com/$package_author/$package_name

echo Rendering templates $(find ./*)

# evaluate templates
for templateFile in $(find ./*); do

  echo rendering template ${templateFile}
  cat $templateFile | envsubst > "${templateFile}.tmp"
  mv -f "${templateFile}.tmp" ${templateFile}
done;

# install dev dependencies
yarn add --dev `cat ./devDependencies`
rm ./devDependencies

# add travis
travis sync
travis enable --no-interactive

# push skeleton to GH
git add . --all
git commit -m "project skeleton"
git push --set-upstream origin master

# publish skeleton release
npm version patch
git push --follow-tags
npm publish
