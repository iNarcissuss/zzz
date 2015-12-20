sed -i 's|sudo | |gi' ./install.sh
./install.sh
find ./middleware/* | xargs -Ixxx touch xxx
touch ./qira ./static2
