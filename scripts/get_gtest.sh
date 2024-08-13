#!/bin/bash
set -ex

GTEST_SRC_TAR=$PROJ_ROOT_DIR/third_party/googletest-release-1.10.0.tgz
GTEST_SRC_DIR=$DEPENDS_DIR/googletest-release-1.10.0
GTEST_BUILD_DIR=$GTEST_SRC_DIR/build

function extract_gtest() {
    if ! test -d $GTEST_SRC_DIR; then
        pushd $DEPENDS_DIR
        tar -xf $GTEST_SRC_TAR
        popd
    fi
}

function compile_gtest() {
    rm -rf $GTEST_BUILD_DIR && mkdir $GTEST_BUILD_DIR
    rm -rf $GTEST_INSTALL_DIR && mkdir $GTEST_INSTALL_DIR

    pushd $GTEST_BUILD_DIR
    cmake -DCMAKE_C_COMPILER=$HOST_CC \
          -DCMAKE_CXX_COMPILER=$HOST_CXX \
          -DCMAKE_CXX_STANDARD=11 \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=$GTEST_INSTALL_DIR ..
    make -j8
    make install
    make clean
    popd
}

function clear_gtest() {
    rm -rf $GTEST_SRC_DIR
}

extract_gtest
compile_gtest
clear_gtest
