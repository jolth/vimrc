#!/usr/bin/env bash

#
# Script to install my vimrc
#
# curl -sL https://raw.githubusercontent.com/jolth/vimrc/master/install.sh | bash -
#   or
# wget -qO- https://raw.githubusercontent.com/jolth/vimrc/master/install.sh | bash -
#


PWD=$(pwd)
vimrc=~/.vimrc

#       Configure 
#fast saving:
#echo "bind -r '\C-s' ; stty -ixon" >> ~/.bashrc;source ~/.bashrc
echo -e "bind -r '\C-s'\nstty -ixon" >> ~/.bashrc;source ~/.bashrc

# Check that Git exists 
if [ ! -e $(which git) ]; then
    echo "Git is required, install please git"
    exit 1
fi

#if [ -e ~/.vimrc ]; then
if [ -e $vimrc ]; then
    #if [ -L ~/.vimrc ]; then
    #    rm 
    #fi
    echo ".vimrc file exists"
    echo "backup into raw created"
    mv ~/.vimrc{,_$(date +'%d%m%y%H%M%S')}
fi

if [ -d ~/.vim ]; then
    echo ".vim directory exist"
fi
               

               

