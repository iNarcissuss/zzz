echo "deb http://repo.kali.org/kali sana main non-free contrib" > /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
apt-get update
apt-get -y install binutils-multiarch-dev
python2 setup.py build
find ./* | grep -v -P '(mk.sh|/build)' | xargs -Ixxx rm -rf xxx
find ./build/* | xargs -Ixxx touch xxx