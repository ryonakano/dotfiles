#!/bin/bash

CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

LIBSECRET_PATH=/usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
LIBSECRET_LINK=/usr/libexec/git-core/git-credential-libsecret

DIFF_HIGHLIGHT_PATH=/usr/share/git-core/contrib/diff-highlight
DIFF_HIGHLIGHT_LINK=/usr/local/bin/diff-highlight

which apt > /dev/null
if [ $? -eq 0 ]; then
	# Install git-credential-libsecret
	# https://florianwinkelbauer.com/posts/2021-05-27-git-gnome-keyring/
	pushd $(dirname $LIBSECRET_PATH) > /dev/null

	sudo make
	sudo mkdir -p $(dirname $LIBSECRET_LINK)
	sudo ln -svfT $LIBSECRET_PATH $LIBSECRET_LINK

	popd > /dev/null # $(dirname $LIBSECRET_PATH)

	DIFF_HIGHLIGHT_PATH=/usr/share/doc/git/contrib/diff-highlight/diff-highlight
fi

# Install gitconfig
git config --get-regexp include.path | grep -qw "$CONFIG_HOME/git/gitconfig"
if [ $? -ne 0 ]; then
	git config --global --add include.path "$CONFIG_HOME/git/gitconfig"
fi

# Enable diff-highlight
sudo chmod +x $DIFF_HIGHLIGHT_PATH
if [ ! -e $DIFF_HIGHLIGHT_LINK ]; then
	sudo ln -sf $DIFF_HIGHLIGHT_PATH $DIFF_HIGHLIGHT_LINK
fi
