#!/bin/bash

# Install Node.js that tree-sitter-cli depends on
# https://github.com/tree-sitter/tree-sitter/blob/aff9b9d92e628bdb159189b7066baa00e8f7535e/crates/cli/README.md#dependencies
# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# in lieu of restarting the shell
. "$HOME/.nvm/nvm.sh"

# Download and install Node.js
nvm install 24

# Install tree-sitter-cli that nvim-treesitter requires
# See https://github.com/nvim-treesitter/nvim-treesitter/tree/main#requirements
cargo install tree-sitter-cli
