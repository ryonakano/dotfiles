#!/bin/bash

PKGS="neovim"

# Install C and C++ compiler that tree-sitter-cli depends on
# See https://github.com/tree-sitter/tree-sitter/blob/aff9b9d92e628bdb159189b7066baa00e8f7535e/crates/cli/README.md#dependencies
PKGS="$PKGS gcc gcc-c++"

# Install clang because installation of tree-sitter-cli fails with the following message:
#   Unable to find libclang: "couldn't find any valid shared libraries matching:
#   ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'],
#   set the `LIBCLANG_PATH` environment variable to a path where one of
#   these files can be found (invalid: [])"
# See https://github.com/DelSkayn/rquickjs/issues/589
PKGS="$PKGS clang-devel"

# Install VLS for LSP
PKGS="$PKGS meson vala vala-language-server"

sudo dnf install -y "$PKGS"
