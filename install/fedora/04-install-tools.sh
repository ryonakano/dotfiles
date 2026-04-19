#!/bin/bash

PKGS=" \
	tig \
	tmux \
	tree \
	flatpak \
	ibus-skk \
"

sudo dnf install -y $PKGS
