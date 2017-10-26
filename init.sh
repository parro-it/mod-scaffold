#!/bin/sh
filename=`readlink -f ${0}`;
export CUR_DIR=`pwd`;
cd `dirname $filename`;
npm run init -- $1 $2;
