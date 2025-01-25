#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup toolchain add stable
rustup toolchain add nightly

# shellcheck disable=SC2016
echo 'export PATH="$HOME/.cargo/bin:$PATH' >> "$HOME/.zsh_custom"
