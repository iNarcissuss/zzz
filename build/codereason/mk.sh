#!/usr/bin/env bash
./install_deps.sh
./make.sh
mkdir /tmp/cpy
cp -r ./libvex/build/libvex.so ./build/bin/* ./scripts ./mk.sh /tmp/cpy
rm -rf ./libs ./capstone* ./build ./libvex
