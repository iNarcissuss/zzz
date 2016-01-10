# echo "deb http://repo.kali.org/kali sana main non-free contrib" > /etc/apt/sources.list
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
# apt-get update
# sudo update-alternatives --remove-all gcc 
# sudo update-alternatives --remove-all g++
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
# sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
# sudo update-alternatives --config gcc
# sudo update-alternatives --config g++
# apt-get install libc6-dev-i386 lynx g++-4.8-multilib build-essential libboost-all-dev qt-sdk
apt-get install libqt4-dev
# source ~/.bashrc
make
