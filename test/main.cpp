#include <gtest/gtest.h>

int main(int argc, char *argv[]) {
    testing::GTEST_FLAG(break_on_failure) = true;
    testing::InitGoogleTest(&argc, argv);
    int ret = RUN_ALL_TESTS();
    return ret;
}