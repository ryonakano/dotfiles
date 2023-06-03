#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS="wget vim"

# vimrc
VIMRC=~/.vimrc
VIMRC_GENERAL=$CWD/vimrc_general

# vim-plug
AUTOLOAD_DIR=~/.vim/autoload
VIM_PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

# Install vimrc
grep -wq $VIMRC_GENERAL $VIMRC
if [ $? -ne 0 ]; then
	echo "source $VIMRC_GENERAL" >> $VIMRC
fi

# Install vim-plug
mkdir -p $AUTOLOAD_DIR
wget -O $AUTOLOAD_DIR/plug.vim $VIM_PLUG_URL
