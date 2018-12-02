#!/bin/bash

brew install go-jira

ln -s "$DOTFILES/.jira.d" "$HOME"

cat <<TEXT
Additional Setup:

export JIRA_API_TOKEN=""
export JIRA_ENDPOINT=""
export JIRA_LOGIN=""
TEXT
