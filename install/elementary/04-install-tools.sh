#!/bin/bash

PKGS=" \
	tig \
	tmux \
	tree \
	flatpak \
	ibus-skk \
	wl-clipboard \
"

sudo apt update
sudo apt install -y $PKGS
