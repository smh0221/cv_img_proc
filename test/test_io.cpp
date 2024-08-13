#include <string>
#include <gtest/gtest.h>
#include <opencv2/opencv.hpp>

TEST(IoTest, ReadAndWrite) {
    cv::Mat img = cv::imread("./data/lena.jpg");
    cv::imwrite("./data/lena.bmp", img);
    return;
}