#!/bin/bash

PKGS=" \
	flatpak \
	ibus-skk \
	(qemu-user-static|qemu-user-binfmt-hwe) \
	tig \
	tmux \
	tree \
	wl-clipboard \
"

sudo apt update
sudo apt-get install -y $PKGS
