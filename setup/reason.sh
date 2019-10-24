#!/bin/bash

# shellcheck source=/dev/null
source "${BASH_SOURCE%/*}/helpers/github.sh"

pushd /tmp || exit
  wget "$(getLatestReleaseURL jaredly reason-language-server rls-macos)"

  unzip rls-macos.zip

  mv rls-macos/reason-language-server /usr/local/bin

  rm -rf rls-macos*
popd || exit

yarn global add bs-platform
