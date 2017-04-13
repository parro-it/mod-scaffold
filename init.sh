filename=`readlink -f ${0}`
cd `dirname $filename`
npm run init -- $1 $2
