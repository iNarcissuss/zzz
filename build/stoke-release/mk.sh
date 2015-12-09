sudo update-alternatives --remove-all gcc 
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

apt-get install -y ccache flex bison
cabal update
cabal install cabal-install regex-tdfa split
export CFLAGS='-pipe'
export CXXFLAGS='-pipe'
make
# make sandybridge
#make nehalem
