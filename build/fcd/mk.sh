sed -i 's|trusty|devel|gi' /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive
apt update
#apt install clang-3.7 llvm-3.7
apt-get -y install clang-3.8 llvm-3.8 libcapstone3 libcapstone-dev libedit-dev python-dev
sed -i 's|3.7|3.8|gi' Makefile
make
