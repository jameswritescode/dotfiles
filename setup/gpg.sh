#!/bin/bash

brew install gpg pinentry-mac
cp "$DOTFILES/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
killall gpg-agent
