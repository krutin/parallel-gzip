#!/bin/bash
# Script to Download and Build Gzip

FILE=gzip
<<<<<<< HEAD
BUILD=gzip-1.3.3
ZIP=gzip-1.3.3.tar.gz
SRC=http://www.gzip.org/gzip-1.3.3.tar.gz
TAR_FLAGS="-xvf"
=======
BUILD=gzip124
ZIP=gz124src.zip
SRC=http://www.gzip.org/gz124src.zip
>>>>>>> 4f98a2885e75203fdf23c2ac0a1dadfaba3d343c

if [ -f $FILE ]
then
    echo "gzip executable found in directory"
else
    if [ -f "$BUILD/$FILE" ]        
    then
        cp "$BUILD/$FILE" .
    else 
	if [ -d "$BUILD" ]
        then
            rm -rf "$BUILD"
        fi
        
        if [ -f "$ZIP" ]
        then
            rm "$ZIP"   # Since the build Folder wasn't there we'll just redownload the tar to be safe, we could to more checking but that is messy.            
        fi

        wget $SRC
        unzip $ZIP
        rm $ZIP
	
	if [ -f "$BUILD/configure" ]
	then
            (cd $BUILD && chmod u+x ./configure && ./configure && make)
        else
            (cd $BUILD && make)
        fi

        cp "$BUILD/$FILE" .
        rm -rf $BUILD
     fi
fi
