cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(cv_img_proc)

# 定义C++ or C编译选项
# 对gtest编译时编译器版本与当前编译器版本不匹配问题进行兼容
# 参考：https://blog.csdn.net/ithiker/article/details/120993302
# add_compile_definitions(_GLIBCXX_USE_CXX11_ABI=0)

add_subdirectory(src)
add_subdirectory(test)