#!/bin/bash
set -ex

SCRIPT_DIR="$(dirname $(readlink -f "$0"))"
PROJ_ROOT_DIR=$SCRIPT_DIR
DEPENDS_DIR="$PROJ_ROOT_DIR/depends"

HOST_SYSROOT=/opt/compiler/gcc-8.2
HOST_CXX=$HOST_SYSROOT/bin/g++
HOST_CC=$HOST_SYSROOT/bin/gcc

GTEST_INSTALL_DIR=$DEPENDS_DIR/gtest
GTEST_LIB_DIR="$GTEST_INSTALL_DIR/lib"
GTEST_INCLUDE_DIR="$GTEST_INSTALL_DIR/include"

OPENCV_INSTALL_DIR=$DEPENDS_DIR/opencv
OPENCV_LIB_DIR="$OPENCV_INSTALL_DIR/lib"
OPENCV_INCLUDE_DIR="$OPENCV_INSTALL_DIR/include"

if test ! -f $GTEST_LIB_DIR/libgtest.so || test ! -d $GTEST_INCLUDE_DIR; then
    source scripts/get_gtest.sh
fi

if test ! -f $OPENCV_LIB_DIR/libopencv_core.so || test ! -d $OPENCV_INCLUDE_DIR; then
    source ./scripts/get_opencv.sh
fi

BUILD_DIR="$PROJ_ROOT_DIR/build"
OUTPUT_DIR="$PROJ_ROOT_DIR/output"
mkdir -p $BUILD_DIR
mkdir -p $OUTPUT_DIR

LIB_NAME="imgproc"

cd $BUILD_DIR
cmake .. \
    -DCMAKE_C_COMPILER=$HOST_CC \
    -DCMAKE_CXX_COMPILER=$HOST_CXX \
    -DLIB_NAME=$LIB_NAME \
    -DOUTPUT_DIR=$OUTPUT_DIR \
    -DGTEST_LIB_DIR=$GTEST_LIB_DIR \
    -DOPENCV_LIB_DIR=$OPENCV_LIB_DIR \
    -DGTEST_INCLUDE_DIR=$GTEST_INCLUDE_DIR \
    -DOPENCV_INCLUDE_DIR=$OPENCV_INCLUDE_DIR
    make -j8
cd -
