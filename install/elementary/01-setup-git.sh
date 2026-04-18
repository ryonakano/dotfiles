#!/bin/bash

LIBSECRET_PATH=/usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
LIBSECRET_LINK=/usr/libexec/git-core/git-credential-libsecret

DIFF_HIGHLIGHT_PATH=/usr/share/doc/git/contrib/diff-highlight/diff-highlight
DIFF_HIGHLIGHT_LINK=/usr/local/bin/diff-highlight

sudo apt update
sudo apt install -y \
	make \
	gcc \
	libsecret-1-dev

# Install git-credential-libsecret
# https://florianwinkelbauer.com/posts/2021-05-27-git-gnome-keyring/
sudo make -C $(dirname $LIBSECRET_PATH)
sudo mkdir -p $(dirname $LIBSECRET_LINK)
sudo ln -svfT $LIBSECRET_PATH $LIBSECRET_LINK

# Enable diff-highlight
sudo chmod +x $DIFF_HIGHLIGHT_PATH
if [ ! -e $DIFF_HIGHLIGHT_LINK ]; then
	sudo ln -sf $DIFF_HIGHLIGHT_PATH $DIFF_HIGHLIGHT_LINK
fi
