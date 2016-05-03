apt-get install -y openjdk-7-jdk
./gradlew build fatJar
mkdir ./out
mv ./build/libs/*.jar ./scripts ./out
find ./* | grep -v -P '(mk.sh|./out|./scripts)' | xargs -Ixxx rm -rf xxx
find ./scripts/* | xargs -Ixxx touch xxx
mv ./out/* ./
rm -rf ./out
