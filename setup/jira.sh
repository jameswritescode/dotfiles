#!/bin/bash

# shellcheck source=/dev/null
source "${BASH_SOURCE%/*}/helpers/github.sh"

wget "$(getLatestReleaseURL go-jira go-jira darwin)"

INSTALLPATH=/usr/local/bin/jira

mv jira-* "$INSTALLPATH"
chmod +x "$INSTALLPATH"

ln -s "$DOTFILES/.jira.d" "$HOME"

cat <<TEXT
Additional Setup:

export JIRA_API_TOKEN=""
export JIRA_ENDPOINT=""
export JIRA_LOGIN=""
TEXT
