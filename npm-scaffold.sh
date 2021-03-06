cd $CUR_DIR;
pwd;

export PATH=./node_modules/.bin:$PATH
export package_author=`npm config get init-author`
export template=$1
export package_name=$2

echo scaffolding $package_name using $package_author/$template as model

# clone from author template repo
git clone https://github.com/$package_author/$template.git $package_name &&

cd $package_name &&

sh init.sh
