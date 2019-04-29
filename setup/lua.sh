#!/bin/bash

brew install lua luarocks

luarocks install --server=http://luarocks.org/dev lua-lsp
