cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(cv_img_proc)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(HOST_SYSROOT /opt/compiler/gcc-8.2)

add_subdirectory(src)
add_subdirectory(test)