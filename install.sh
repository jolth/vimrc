#!/usr/bin/env bash

#
# Script to install my vimrc
#
# curl -sL https://raw.githubusercontent.com/jolth/vimrc/master/install.sh | bash -
#   or
# wget -qO- https://raw.githubusercontent.com/jolth/vimrc/master/install.sh | bash -
#

PWD=$(pwd)
vimrcf=~/.vimrc
vimd=~/.vim

#       Configure 
#fast saving:
echo -e "bind -r '\C-s'\nstty -ixon" >> ~/.bashrc;source ~/.bashrc

# Check that Git exists 
if [ ! -e $(which git) ]; then
    echo "Git is required, install please git"
    exit 1
fi

if [ -e $vimrcf ]; then
    echo ".vimrc file exists"
    echo "backup into raw created"
    mv ${vimrcf}{,_$(date +'%d%m%y%H%M%S')} 
fi

if [ -d $vimd ]; then
    echo ".vim directory exist"
    echo "backup into raw created"
    mv ${vimd}{,_$(date +'%d%m%y%H%M%S')}
fi

# Vundle install
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Clone my vimrc
git clone https://github.com/jolth/vimrc.git ~/.vim/vimrc/
# Configure and Install
ln -s ~/.vim/vimrc/vimrcs/vimrc ~/.vimrc
vim +PluginInstall +qall
