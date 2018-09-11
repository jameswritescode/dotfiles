#!/bin/bash

curl https://sh.rustup.rs -sSf | sh

rustup toolchain add nightly
rustup component add rust-src rust-docs rls-preview rust-analysis
  \ rustfmt-preview

rust_toolchain=$(rustup toolchain list | awk '{print $1}')
echo "export RUST_SRC_PATH=\"\$HOME/.multirust/toolchains/$rust_toolchain/lib/rustlib/src/rust/src\"" >> "$HOME/.zsh_custom"

cargo +nightly install racer
