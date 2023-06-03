#!/bin/bash

CWD=$(cd $(dirname $0); echo $PWD)
DEPS=""

# bash_aliases
BASH_ALIASES=~/.bash_aliases
BASH_ALIASES_GENERAL=$CWD/bash_aliases_general

# Install prerequirements
if [ "$DEPS" != "" ]; then
	sudo apt install -y $DEPS
fi

# Install bash_aliases
grep -wq $BASH_ALIASES_GENERAL $BASH_ALIASES
if [ $? -ne 0 ]; then
	echo "source $BASH_ALIASES_GENERAL" >> $BASH_ALIASES
fi
