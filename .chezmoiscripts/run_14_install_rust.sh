#!/bin/bash

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rust-analyzer
rustup component add rust-src
