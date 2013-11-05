#!/bin/sh

test -z $SOURCE_DIR && SOURCE_DIR=$HOME/development/alps/tutorials

set -x

if test -d $SOURCE_DIR; then
    cp -p $SOURCE_DIR/alpsize-02-original-c/wolff.c 02_wolff.c
    (cd $SOURCE_DIR && diff -u alpsize-02-original-c/wolff.c alpsize-03-basic-cpp/wolff.C) > 03_wolff.diff
fi
