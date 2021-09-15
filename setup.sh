#!/bin/bash

set -x

if [[ "$OSTYPE" = "darwin"* ]]; then
        echo "TODO initial macos setup"
elif [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release 2>/dev/null) == '"Ubuntu"' ]]; then
        sudo apt-get install -y software-properties-common build-essential

        ./setup/git.sh install_ubuntu
        ./setup/zsh.sh install_ubuntu
        ./setup/python.sh install_ubuntu
        ./setup/node.sh install_ubuntu
        ./setup/fzf.sh install_ubuntu
        ./setup/neovim.sh install_ubuntu
else
        echo "unsupported operating system"
fi
