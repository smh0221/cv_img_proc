#!/bin/bash
set -ex

SCRIPT_DIR="$(dirname $(readlink -f "$0"))"
PROJ_ROOT_DIR=$SCRIPT_DIR

GTEST_LIB_DIR="$PROJ_ROOT_DIR/depends/gtest/lib"
OPENCV_LIB_DIR="$PROJ_ROOT_DIR/depends/opencv/lib"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPENCV_LIB_DIR:$GTEST_LIB_DIR

cd output/bin/unit_tests
