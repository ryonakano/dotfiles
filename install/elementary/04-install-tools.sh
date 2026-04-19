#!/bin/bash

PKGS=" \
	tig \
	tmux \
	tree \
	flatpak \
	ibus-skk \
"

sudo apt update
sudo apt install -y $PKGS
