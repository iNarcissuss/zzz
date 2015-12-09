S2EDIR=`pwd`
apt-get update
apt-get install build-essential subversion gettext liblua5.1-0-dev libsdl1.2-dev libsigc++-2.0-dev binutils-dev python-docutils python-pygments nasm libiberty-dev libc6-dev-i386
apt-get build-dep llvm-3.3
apt-get build-dep qemu

mkdir $S2EDIR/build
cd $S2EDIR/build
make -f ../Makefile
