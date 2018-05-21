#!/bin/bash

# update vimrc
cp ~/.vimrc ~/.vimrc.old
cp .vimrc ~/
vim +PluginInstall +qall

# setup cscope
mkdir -p ~/bin
cp mkscope.sh ~/bin
echo "PATH=\$PATH:~/bin" >> ~/.bashrc
sudo apt-get install cscope ctags -y

# Reload bashrc 
source ~/.bashrc 

