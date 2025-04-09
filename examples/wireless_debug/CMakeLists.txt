# The following lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.5)


if(NOT EXISTS ./components/lcd/Adafruit-GFX-Library)
message(FATAL_ERROR "Adafruit-GFX-Library is not downloaded and run, the following command:")
message(FATAL_ERROR "git clone -b v1.2.3 https://github.com/adafruit/Adafruit-GFX-Library.git components/lcd/Adafruit-GFX-Library")
endif()

include($ENV{IDF_PATH}/tools/cmake/project.cmake)

project(wireless_debug)
