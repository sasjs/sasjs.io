#!/bin/bash
####################################################################
# PROJECT: SASjs Developer Guide                                   #
####################################################################

BUILD_FOLDER="/tmp/sasjs_build"


## Create regular mkdocs docs
echo 'building sasjs mkdocs'
mkdocs build --clean


rm -rf $BUILD_FOLDER
mkdir $BUILD_FOLDER

cp -r ./site/* $BUILD_FOLDER

cd $BUILD_FOLDER
git clone git@github.com:macropeople/sasjs.github.io.git .
git rm -r *
echo 'sasjs.io' > CNAME
git add *
git commit -m "build.sh build on $(date +%F:%H:%M:%S)"
git push
