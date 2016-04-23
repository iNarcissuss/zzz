apt-get install -y openjdk-7-jdk
git submodule update --init --recursive
./gradlew fatjar
