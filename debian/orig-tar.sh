#!/bin/sh -e

VERSION=$2
ORIG_TAR=$3
TAR=../ant_$VERSION.orig.tar.xz
DIR=apache-ant-$VERSION

tar xvzf $ORIG_TAR
rm $ORIG_TAR
XZ_OPT=--best tar -c -J -f $TAR --exclude '*.jar' --exclude '*.pdf' $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi

