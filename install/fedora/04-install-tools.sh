#!/bin/bash

PKGS=" \
	flatpak \
	ibus-skk \
	qemu-user-static-aarch64 \
	tig \
	tmux \
	tree \
	wl-clipboard \
"

sudo dnf install -y $PKGS
