sudo apt-get install clang++ libkqueue-dev libbsd-dev gnustep-base-common gnustep-gui-common libobjc2 libudev-dev openssl libgc-dev
CC=clang CXX=clang++ cmake .
make
