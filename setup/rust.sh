#!/bin/bash
# shellcheck disable=SC1090

curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path

source "$HOME/.cargo/env"

rustup toolchain add nightly
rustup component add rust-src rls-preview rust-analysis rustfmt-preview clippy-preview

echo "export PATH=\"$HOME/.cargo/bin:\$PATH\"" >> "$HOME/.zsh_custom"
