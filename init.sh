#!/bin/zsh
filename=${0:a:h}
echo $filename
cd `dirname $filename`
npm run init -- $1 $2
