set -x
sed -i 's|sudo | |gi' ./install.sh
bash -x ./install.sh
find ./middleware/* | xargs -Ixxx touch xxx
touch ./qira ./static2
