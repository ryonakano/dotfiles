#!/bin/bash

PKGS="neovim"

# Install VLS for LSP
PKGS="$PKGS meson vala vala-language-server"

sudo dnf install -y $PKGS
