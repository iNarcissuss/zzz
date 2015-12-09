apt-get -y install libboost-dev cmake libqt4-dev
INST_DIR=$PWD
mkdir build; cd build
cmake -D CMAKE_INSTALL_PREFIX=$INST_DIR ../src
cmake --build .
cmake --build . --target install
