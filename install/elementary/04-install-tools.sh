#!/bin/bash

PKGS=" \
	flatpak \
	ibus-skk \
	qemu-user-static \
	tig \
	tmux \
	tree \
	wl-clipboard \
"

sudo apt update
sudo apt install -y $PKGS
