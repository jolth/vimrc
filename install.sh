#!/usr/bin/env bash

#
# Script to install my vimrc
#
# curl -sL https://raw.githubusercontent.com/jolth/vimrc/master/install.sh | bash -
#   or
# wget -qO- https://raw.githubusercontent.com/jolth/vimrc/master/install.sh | bash -
#


DIR=$(pwd)

echo $DIR


#       Configure 
#fast saving:
echo "bind -r '\C-s' ; stty -ixon" >> ~/.bashrc;source ~/.bashrc

if [ ! -e $(which git) ]; then
    echo "Git is required, install please git"
    exit 1
fi

               

               

