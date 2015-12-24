apt-get update
apt-get install git gcc-multilib g++-multilib build-essential cmake libc6-i386 nasm
mkdir build; cd $_
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
make
