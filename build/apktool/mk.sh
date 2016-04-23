apt-get install -y openjdk-7-jdk
./gradlew build fatJar
mkdir ./out
mv ./build/libs/*.jar ./out
find ./* | grep -v -P '(mk.sh|./out)' | xargs -Ixxx rm -rf xxx
mv ./out/* ./
rm -rf ./out
