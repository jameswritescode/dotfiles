#!/bin/bash

# shellcheck source=/dev/null
source "${BASH_SOURCE%/*}/helpers/asdf.sh"

asdf_install erlang
asdf_install elixir

mix local.hex --force
mix local.rebar --force
