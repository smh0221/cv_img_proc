#!/usr/bin/bash

OPENCV_SRC_TAR=$PROJ_ROOT_DIR/third_party/opencv-3.4.17.tar.gz
OPENCV_SRC_DIR=$DEPENDS_DIR/opencv-3.4.17
OPENCV_BUILD_DIR=$OPENCV_SRC_DIR/build

function extract_opencv() {
    if ! test -d $OPENCV_SRC_DIR; then
        pushd $DEPENDS_DIR
        tar -xf $OPENCV_SRC_TAR
        popd
    fi
}

function compile_opencv() {
    rm -rf $OPENCV_BUILD_DIR && mkdir $OPENCV_BUILD_DIR
    rm -rf $OPENCV_INSTALL_DIR && mkdir $OPENCV_INSTALL_DIR

    pushd $OPENCV_BUILD_DIR
    cmake -DCMAKE_C_COMPILER=$HOST_CC \
          -DCMAKE_CXX_COMPILER=$HOST_CXX \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_PERF_TESTS=OFF \
          -DBUILD_TESTS=OFF \
          -DBUILD_JASPER=ON \
          -DBUILD_JPEG=ON \
          -DBUILD_PNG=ON \
          -DBUILD_TIFF=ON \
          -DBUILD_WEBP=ON \
          -DBUILD_ZLIB=ON \
          -DBUILD_JAVA=OFF \
          -DBUILD_opencv_apps=OFF \
          -DBUILD_opencv_java_bindings_gen=OFF \
          -DBUILD_opencv_js=OFF \
          -DBUILD_opencv_js_bindings_gen=OFF \
          -DBUILD_opencv_ml=OFF \
          -DBUILD_opencv_objdetect=OFF \
          -DBUILD_opencv_photo=OFF \
          -DBUILD_opencv_shape=OFF \
          -DBUILD_opencv_stitching=OFF \
          -DBUILD_opencv_superres=OFF \
          -DBUILD_opencv_ts=OFF \
          -DBUILD_opencv_video=OFF \
          -DBUILD_opencv_videoio=OFF \
          -DBUILD_opencv_videostab=OFF \
          -DBUILD_opencv_python_bindings_generator=OFF \
          -DBUILD_opencv_python_tests=OFF \
          -DWITH_OPENMP=ON \
          -DWITH_1394=OFF \
          -DWITH_FFMPEG=OFF \
          -DWITH_GSTREAMER=OFF \
          -DWITH_PROTOBUF=OFF \
          -DWITH_GTK=OFF \
          -DWITH_GTK_2_X=OFF \
          -DWITH_IPP=OFF \
          -DWITH_ITT=OFF \
          -DENABLE_PROFILING=OFF \
          -DOPENCV_ENABLE_NONFREE=ON \
          -DCMAKE_DEBUG_POSTFIX=d \
          -DCMAKE_INSTALL_PREFIX=$OPENCV_INSTALL_DIR ..
    make -j8
    make install
    make clean
    popd
}

function clear_opencv() {
    rm -rf $OPENCV_SRC_DIR
}

extract_opencv
compile_opencv
clear_opencv
