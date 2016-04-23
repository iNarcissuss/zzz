apt-get install -y build-essential curl git bison flex bc libcap-dev git cmake libboost-all-dev libncurses5-dev python-minimal python-pip unzip
export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu  
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main" >> /etc/apt/sources.list
echo "deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main" >> /etc/apt/sources.list
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -  
apt-get update  
apt-get install -y clang-3.4 llvm-3.4 llvm-3.4-dev llvm-3.4-tools  
ln -sf /usr/bin/llvm-config-3.4 /usr/bin/llvm-config
#_____________________________[stp]
git clone https://github.com/stp/minisat.git
cd minisat
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/ ../
sudo make install
cd ../../
git clone https://github.com/stp/stp.git
mkdir stp/build
cd stp/build
cmake -DBUILD_SHARED_LIBS:BOOL=OFF -DENABLE_PYTHON_INTERFACE:BOOL=OFF ..
make
sudo make install
cd ../../
ulimit -s unlimited
#_____________________________[continue]
./configure --with-stp=`pwd`/stp/build --enable-posix-runtime
make
rm -rf ./stp ./minisat
