#!/bin/bash

# Neovim available from apt is old, so install via snap instead
PKGS="snapd"

# Install C and C++ compiler that tree-sitter-cli depends on
# See https://github.com/tree-sitter/tree-sitter/blob/aff9b9d92e628bdb159189b7066baa00e8f7535e/crates/cli/README.md#dependencies
PKGS="$PKGS gcc g++"

# Install clang because installation of tree-sitter-cli fails with the following message:
#   Unable to find libclang: "couldn't find any valid shared libraries matching:
#   ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'],
#   set the `LIBCLANG_PATH` environment variable to a path where one of
#   these files can be found (invalid: [])"
# See https://github.com/DelSkayn/rquickjs/issues/589
PKGS="$PKGS libclang-20-dev"

# Install VLS for LSP
PKGS="$PKGS meson valac vala-language-server"

sudo apt update
sudo apt install -y $PKGS

sudo snap install --classic nvim
