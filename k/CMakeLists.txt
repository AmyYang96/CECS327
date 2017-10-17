cmake_minimum_required(VERSION 2.8)

SET(GCC_COVERAGE_LINK, "-lsubunit")
project(ckbsim)

enable_testing()

add_subdirectory (src)
