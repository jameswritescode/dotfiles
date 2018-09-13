#!/bin/bash

LATEST_STABLE_NODE=$(asdf list-all nodejs | tail -n 1)
asdf install nodejs "$LATEST_STABLE_NODE"
asdf global nodejs "$LATEST_STABLE_NODE"
