#!/bin/bash
####################################################################
# PROJECT: SASjs Developer Guide                                   #
####################################################################

BUILD_FOLDER="/tmp/sasjs_build"
CWD="$(pwd)"

## Create regular mkdocs docs
echo 'building sasjs mkdocs'
mkdocs build --clean


rm -rf $BUILD_FOLDER
mkdir $BUILD_FOLDER

cd $BUILD_FOLDER
git clone git@github.com:sasjs/sasjs.io.git .
git checkout gh-pages
rm -r *
cp -r $CWD/site/* $BUILD_FOLDER
echo 'sasjs.io' > CNAME

# build slides
npx @marp-team/marp-cli slides6min.md ./theme/slides/appdev.html


git add .
git commit -m "build.sh build on $(date +%F:%H:%M:%S)"
git push

