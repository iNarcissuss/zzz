apt-get install -y openjdk-7-jdk
./gradlew build fatJar
find ./* | grep -v -P '(mk.sh|apktool-.*.jar)' | xargs -Ixxx rm -rf xxx
