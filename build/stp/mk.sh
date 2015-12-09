echo "deb http://repo.kali.org/kali sana main non-free contrib" > /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
apt-get update
apt-get install -y cmake bison flex libboost-all-dev
apt-get upgrade cmake
mkdir build && cd build
cmake -G 'Unix Makefiles' ../
make
