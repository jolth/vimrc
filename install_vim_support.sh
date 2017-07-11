#!/usr/bin/env bash
# only for Debian and your flavors
# sudo bash install_vim_support.sh

#VIMTMP=/tmp/vim/
VIMTMP=~/vim/

echo -e ">> removent vim\n"

for i in $(dpkg --get-selections|grep -i vim|cut -f1); do
  echo "remove -> $i"
  sudo apt purge $i --yes
done

echo -e "\n>> install dependencies\n"
sudo apt install python-dev python3-dev libncurses5-dev ruby-dev git --yes

echo -e "\n>> download vim sources\n"
git clone http://github.com/vim/vim.git $VIMTMP

echo -e "\n>> configure and install\n"
#cd $VIMTMP && make disclean 
cd $VIMTMP && ./configure --with-features=big --enable-pythoninterp \
  --enable-rubyinterp --enable-enablemultibyte --enable-gui=no --with-x \
  --enable-cscope --enable-python3interp --prefix=/usr

#--enable-pythoninterp \
#--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
#--enable-python3interp \
#--with-python-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
#--with-features=big \
#--enable-multibyte \
#--with-x=yes \
#--prefix=/usr

#make VIMRUNTIMEDIR=/usr/share/vim
make
sudo make install

echo -e "\n>> check the support\n"
vim --version|grep --color -i python
