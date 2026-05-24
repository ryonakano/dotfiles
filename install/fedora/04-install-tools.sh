#!/bin/bash

PKGS=" \
	tig \
	tmux \
	tree \
	flatpak \
	ibus-skk \
	wl-clipboard \
"

sudo dnf install -y $PKGS
