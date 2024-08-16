#include <string>
#include <fstream>
#include <gtest/gtest.h>
#include <opencv2/opencv.hpp>

TEST(IoTest, ConvertJPG2BMP) {
    cv::Mat img = cv::imread("./data/lena.jpg");
    cv::imwrite("./data/lena.bmp", img);
    return;
}

TEST(IoTest, ConvertBin2BMP) {
    std::string file_name = "./data/lena_512_512_rgb8.bin";
    int buf_size = 512 * 512 * 3 * sizeof(unsigned char);
    std::vector<unsigned char> vec_src(buf_size);
    std::ifstream ifs(file_name.c_str(), std::ios::binary);
    ASSERT_TRUE(ifs.is_open());
    ifs.read(reinterpret_cast<char *>(vec_src.data()), buf_size);
    cv::Mat img(512, 512, CV_8UC3, vec_src.data());
    cv::imwrite("./data/lena.bmp", img);
    return;
}