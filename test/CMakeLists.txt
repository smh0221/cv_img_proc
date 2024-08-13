project(unit_tests)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR}/bin)

set(SOURCES
    main.cpp
    test_io.cpp
    test_circle.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE ${GTEST_INCLUDE_DIR} ${OPENCV_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/../include)
target_link_directories(${PROJECT_NAME} PRIVATE ${GTEST_LIB_DIR} ${OPENCV_LIB_DIR} ${OUTPUT_DIR}/so)
target_link_libraries(${PROJECT_NAME} PRIVATE gtest_main gtest opencv_core opencv_highgui opencv_imgproc opencv_imgcodecs ${LIB_NAME})