#!/bin/sh

DIRNAME=$(dirname $0)
BW_VERSION="$(grep -o -e "bundlewrap==[^ ]*" $DIRNAME/Dockerfile | sed "s/bundlewrap==//g")"

echo $BW_VERSION
