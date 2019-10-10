#!/bin/bash

curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | bash

cat <<TEXT
Additional Setup:

export HASURA_ADMIN_SECRET=""
TEXT
