#!/bin/bash

CONFIG_PATH="$HOME/.config/solargraph"
mkdir -p "$CONFIG_PATH"
ln -s "$DOTFILES/.solargraph.yml" "$CONFIG_PATH/config.yml"
