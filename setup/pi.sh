#!/bin/bash

set -xeuo pipefail

install_standard() {
    setup/dotconfig.sh link pi

    mkdir -p "$HOME/.pi"
    ln -sfn "$HOME/.config/pi" "$HOME/.pi/agent"

    bunx @every-env/compound-plugin install compound-engineering --to pi

    pnpm install -g @mariozechner/pi-coding-agent

    # shellcheck disable=SC2016
    echo 'export PI_CODING_AGENT_DIR="$HOME/.config/pi"' >> "$HOME/.zsh_custom"
}

install_standard
