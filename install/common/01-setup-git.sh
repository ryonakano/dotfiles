#!/bin/bash

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

# Install gitconfig
git config --get-regexp include.path | grep -qw "$CONFIG_HOME/git/gitconfig"
if [ $? -ne 0 ]; then
	git config --global --add include.path "$CONFIG_HOME/git/gitconfig"
fi
