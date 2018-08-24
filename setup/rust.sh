#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src
rustup component add rust-docs
rust_toolchain=$(rustup toolchain list | awk '{print $1}')
echo "export RUST_SRC_PATH=\"\$HOME/.multirust/toolchains/$rust_toolchain/lib/rustlib/src/rust/src\"" >> "$HOME/.zsh_custom"
cargo install rustfmt
cargo install racer
cargo install exa
