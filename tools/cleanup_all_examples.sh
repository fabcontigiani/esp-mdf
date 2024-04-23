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


declare -a BUILD_DIRS=("get-started" "function_demo/mconfig")
BUILD_DIRS+=("function_demo/mcommon" "function_demo/mdebug" "function_demo/mupgrade")
BUILD_DIRS+=("function_demo/mwifi/console_test" "function_demo/mwifi/mqtt_example" "function_demo/mwifi/no_router" "function_demo/mwifi/root_on_ethernet" "function_demo/mwifi/router")
BUILD_DIRS+=("wireless_debug")
BUILD_DIRS+=("development_kit/buddy" "development_kit/button" "development_kit/light" "development_kit/sense")


for dir in "${BUILD_DIRS[@]}"; 
    do
    	echo "Celaning $dir..."
    	rm -r ../examples/$dir/build/
    	rm -r ../examples/$dir/managed_components/
	rm -r ../examples/$dir/dependencies.lock
	rm -r ../examples/$dir/sdkconfig
	rm -r ../examples/$dir/sdkconfig.old
    done;


