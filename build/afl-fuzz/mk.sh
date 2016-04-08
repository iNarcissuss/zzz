#!/usr/bin/env bash
homePath=`pwd`
url="http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz"

if [[ $1 == 'ver' ]]; then
	date -d "$(curl --head $url 2>/dev/null | grep 'Last' | cut -d':' -f2-)" "+%Y%m%d"
	exit
else
  apt-get install unp bison
  
  wget $url
  unp afl-latest.tgz; rm -rf ./afl-latest.tgz
  cd afl-*
  make
  cd qemu_mode
  nice -n -20 ./build_qemu_support.sh
  cd $homePath
  mv ./afl-* ./afl-latest
  cd ./afl-latest
  rm -rf ./qemu_mode ./*.h ./*.c ./llvm_mode
  touch -h ./*
fi
