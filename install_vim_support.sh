#!/usr/bin/env bash
# only for Debian and your flavors
# sudo bash install_vim_support.sh
# testing: 17-07-2017 Debian GNU/Linux testing (buster)

#VIMTMP=/tmp/vim/
VIMTMP=~/vim/

echo -e ">> removent vim\n"

for i in $(dpkg --get-selections|grep -i vim|cut -f1); do
  echo "remove -> $i"
  sudo apt purge $i --yes
done

echo -e "\n>> install dependencies\n"
sudo apt install python-dev \
  python3-dev \
  libncurses5-dev \
  ruby-dev \
  git \
  liblua5.3-0 \
  libluajit-5.1-2 \
  libluajit-5.1-dev \
  luajit \
  liblua5.3-dev --yes

echo -e "\n>> fix liblua paths\n"
sudo ln -s /usr/include/lua5.3 /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/local/lib/liblua.so
#sudo mkdir /usr/include/lua5.3/include
#sudo ln -s /usr/include/lua5.3/*.h /usr/include/lua5.3/include/

echo -e "\n>> download vim sources\n"
git clone http://github.com/vim/vim.git $VIMTMP

echo -e "\n>> configure and install\n"
#cd $VIMTMP && make disclean 
cd $VIMTMP && ./configure --with-features=big \
  --enable-pythoninterp=yes \
  --enable-rubyinterp=yes \
  --enable-multibyte \
  --enable-gui=no \
  --with-x \
  --enable-largefile \
  --enable-cscope \
  --enable-luainterp=yes \
  --enable-python3interp=yes \
  --prefix=/usr
#  --with-lua-prefix=/usr/include/lua5.3 \
#  --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
#  --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \

#make VIMRUNTIMEDIR=/usr/share/vim
make
sudo make install

echo -e "\n>> check python support\n"
vim --version|grep --color -i python

echo -e "\n>> search vim\n"
ls -ltr $(which vim)

echo -e "\n>> check lua support\n"
vim --version|grep --color -i lua
