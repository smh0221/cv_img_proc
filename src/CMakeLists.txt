project(${LIB_NAME})

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIR}/so)
set(OPENCV_LIBS opencv_core opencv_highgui)

set(SOURCES
    circle.cpp
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE ${OPENCV_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_directories(${PROJECT_NAME} PRIVATE ${OPENCV_LIB_DIR})
target_link_libraries(${PROJECT_NAME} PRIVATE ${OPENCV_LIBS})