#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS=""

# bash_aliases
BASH_ALIASES=~/.bash_aliases
BASH_ALIASES_SDK=$CWD/bash_aliases_sdk

VALA_VER=0.56
SDK_VERS="7.2 "

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

# Install elementary SDK
sudo apt install -y elementary-sdk libvala-$VALA_VER-dev

flatpak install appcenter --user -y io.elementary.Platform --runtime $SDK_VERS
flatpak install appcenter --user -y io.elementary.Sdk --runtime $SDK_VERS

# Install bash_aliases
grep -wq $BASH_ALIASES_SDK $BASH_ALIASES
if [ $? -ne 0 ]; then
	echo "source $BASH_ALIASES_SDK" >> $BASH_ALIASES
fi
