#!/bin/bash

if [[ "$OSTYPE" = "darwin"* ]]; then
        echo "macos"
elif [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release 2>/dev/null) == '"Ubuntu"' ]]; then
        echo "ubuntu"
else
        echo "unsupported operating system"
fi
