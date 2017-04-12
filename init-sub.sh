export current_year=`date +"%Y"`
export package_name=$1
export template=$2
export package_author_name=`yarn config get init-author-name | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"`
export package_author_email=`yarn config get init-author-email | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"`
export package_var=`echo $package_name | sed -r 's/([a-z]+)-([a-z])?([a-z]*)-?([a-z])?([a-z]*)-?([a-z])?([a-z]*)/\1\U\2\L\3\U\4\L\5\U\6\L\7/'`
echo -n "Package description: " && read package_description
export package_description

echo scaffolding $package_name

# clone from author template repo
echo $package_author
git clone 'https://github.com'"/$package_author/$template.git" $package_name

cd $package_name

# remove template git folder
rm -rf .git
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

# push skeleton to GH
git add . --all
git commit -m "$package_name package skeleton"

git push
