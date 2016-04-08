apt-get install libglib2.0-dev
#UNICORN_ARCHS="aarch64" ./make.sh
./make.sh
find ./bindings/* | xargs -Ixxx touch xxx
touch -h libunicorn.*
rm -rf ./qemu ./*.d ./*.o ./*.log
cd bindings/python
make install
\cp -r /usr/local/lib/python2.7/dist-packages/unicorn/ ./
