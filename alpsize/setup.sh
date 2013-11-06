#!/bin/sh

test -z $SOURCE_DIR && SOURCE_DIR=$HOME/development/alps/tutorials

set -x

if test -d $SOURCE_DIR; then
    cp -p $SOURCE_DIR/alpsize-02-original-c/wolff.c 02-wolff.c
    (cd $SOURCE_DIR && diff -u alpsize-02-original-c/wolff.c alpsize-03-basic-cpp/wolff.C) > 03-wolff.diff
    (cd $SOURCE_DIR && diff -u alpsize-03-basic-cpp/wolff.C alpsize-04-stl/wolff.C) > 04-wolff.diff
    (cd $SOURCE_DIR && diff -u alpsize-04-stl/wolff.C alpsize-05-boost/wolff.C) > 05-wolff.diff
    (cd $SOURCE_DIR && diff -u alpsize-05-boost/wolff.C alpsize-06-parameters/wolff.C) > 06-wolff.diff
    (cd $SOURCE_DIR && diff -u alpsize-06-parameters/wolff.C alpsize-07-alea/wolff.C) > 07-wolff.diff
    (cd $SOURCE_DIR && diff -u alpsize-07-alea/wolff.C alpsize-08-lattice/wolff.C) > 08-wolff.diff
    cp -p $SOURCE_DIR/alpsize-09-scheduler/wolff_worker.h 09-wolff_worker.h
    cp -p $SOURCE_DIR/alpsize-09-scheduler/wolff_worker.C 09-wolff_worker.C
    cp -p $SOURCE_DIR/alpsize-09-scheduler/hello_worker.h 09-hello_worker.h
    cp -p $SOURCE_DIR/alpsize-09-scheduler/hello_worker.C 09-hello_worker.C
fi
