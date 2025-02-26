#!/bin/bash

brew install mise

# shellcheck disable=SC2016
echo 'eval "$(mise activate zsh)"' >> "$HOME/.zsh_custom"
