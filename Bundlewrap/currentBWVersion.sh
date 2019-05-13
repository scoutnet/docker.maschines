#!/bin/sh

DIRNAME=$(dirname $0)
BW_VERSION="$(grep -o -e "bundlewrap==[^ ]*" $DIRNAME/Dockerfile | sed "s/bundlewrap==//g")"

if [ "$1" = '--major' ] || [ "$1" = '-M' ]; then
	echo $BW_VERSION | sed s/[.][^.]*[.][^.]*$//g
else
	if [ "$1" = '--minor' ] || [ "$1" = '-m' ]; then
		echo $BW_VERSION | sed s/[.][^.]*$//g
	else
		echo $BW_VERSION
	fi
fi
