set -x
sed -i 's|sudo | |gi' ./install.sh
bash -x ./install.sh
find ./* | xargs -Ixxx touch xxx
# find ./middleware/* ./static2/* ./qiradb/* | xargs -Ixxx touch xxx
