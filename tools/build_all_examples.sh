#!/usr/bin/env bash
# Sample file for batch build of mdf examples

# ANSI Text Color Coding:
NC='\033[0m' # No Color
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

source ./idf-path.txt
# Contents of tools/idf-path.txt can be as simple as following 2 lines (without the octothorpe):
#export IDF_PATH=/path/to/your/local/esp-idf
#export MDF_PATH=/path/to/your/local/esp-mdf

source "$IDF_PATH/export.sh"

# 1. All basic examples for all supported targets

declare -a BUILD_TARGETS=("esp32" "esp32c3" "esp32s2" "esp32s3")

declare -a BUILD_DIRS=("get-started")
BUILD_DIRS+=("function_demo/mcommon" "function_demo/mdebug" "function_demo/mupgrade")
BUILD_DIRS+=("function_demo/mwifi/console_test" "function_demo/mwifi/mqtt_example" "function_demo/mwifi/no_router" "function_demo/mwifi/root_on_ethernet" "function_demo/mwifi/router")

for dir in "${BUILD_DIRS[@]}"; 
    do
    	for target in "${BUILD_TARGETS[@]}"; 
    		do
				# Print Info:
				echo -e "\n${GREEN}==== Building $dir / $target ====${NC}\n"

				./ci/build_examples_cmake.sh ../examples/$dir $target
				[ $? != 0 ] && echo -e "\n${RED}==== idf.py $dir build failed for target $target ====${NC}\n" && exit 1
				
			done;
    done;

# 2. ESP32-S2 doesn't have BT peripheral, which is required for mconfig demo:

declare -a BUILD_TARGETS=("esp32" "esp32c3" "esp32s3")

declare -a BUILD_DIRS=("function_demo/mconfig")
    
for dir in "${BUILD_DIRS[@]}"; 
    do
    	for target in "${BUILD_TARGETS[@]}"; 
    		do
				# Print Info:
				echo -e "\n${GREEN}==== Building $dir / $target ====${NC}\n"

				./ci/build_examples_cmake.sh ../examples/$dir $target
				[ $? != 0 ] && echo -e "\n${RED}==== idf.py $dir build failed for target $target ====${NC}\n" && exit 1
				
			done;
    done;


# Following have other requirements, may not be supported:
#BUILD_DIRS+=("wireless_debug")
#BUILD_DIRS+=("aliyun_linkkit/get-started" "aliyun_linkkit/mesh-with-aliyun" "aliyun_linkkit/test")
#BUILD_DIRS+=("development_kit/buddy" "development_kit/button" "development_kit/light" "development_kit/sense")

