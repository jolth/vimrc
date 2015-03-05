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


if [ -e $(which git) ]; then
    echo "git read"
fi

