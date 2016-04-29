set -x
sed -i 's|sudo | |gi' ./install.sh
bash -x ./install.sh
find ./middleware/* ./static2/* ./qiradb/* | xargs -Ixxx touch xxx
ls -la
touch ./*
