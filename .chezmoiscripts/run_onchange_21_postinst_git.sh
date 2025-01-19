#!/bin/bash

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

DIFF_HIGHLIGHT_PATH=/usr/share/git-core/contrib/diff-highlight
DIFF_HIGHLIGHT_LINK=/usr/local/bin/diff-highlight

# Install gitconfig
git config --get-regexp include.path | grep -qw $CONFIG_HOME/git/gitconfig
if [ $? -ne 0 ]; then
	git config --global --add include.path $CONFIG_HOME/git/gitconfig
fi

# Enable diff-highlight
sudo chmod +x $DIFF_HIGHLIGHT_PATH
if [ ! -e $DIFF_HIGHLIGHT_LINK ]; then
	sudo ln -sf $DIFF_HIGHLIGHT_PATH $DIFF_HIGHLIGHT_LINK
fi
