sudo apt-get update
sudo apt-get install git gcc make python python-dev python-numpy cython
./autogen.sh
./configure
make
make install

find ./ > ./list.txt
rm -rf ./capstone/capstone
