project(unit_tests)

set(EXECUTABLE_OUTPUT_PATH ${OUTPUT_DIR}/bin)
set(GTEST_LIBS gtest gtest_main gmock gmock_main)
set(OPENCV_LIBS opencv_core opencv_highgui)

set(SOURCES
    main.cpp
    test_circle.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE ${GTEST_INCLUDE_DIR} ${OPENCV_INCLUDE_DIR})
target_link_directories(${PROJECT_NAME} PRIVATE ${GTEST_LIB_DIR} ${OPENCV_LIB_DIR})
target_link_libraries(${PROJECT_NAME} PRIVATE ${GTEST_LIBS} ${OPENCV_LIBS})