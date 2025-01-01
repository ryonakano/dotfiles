#!/bin/bash

DIFF_HIGHLIGHT_PATH=/usr/share/git-core/contrib/diff-highlight
DIFF_HIGHLIGHT_LINK=/usr/local/bin/diff-highlight

# Enable diff-highlight
sudo chmod +x $DIFF_HIGHLIGHT_PATH
if [ ! -e $DIFF_HIGHLIGHT_LINK ]; then
	sudo ln -sf $DIFF_HIGHLIGHT_PATH $DIFF_HIGHLIGHT_LINK
fi
