#!/bin/bash

curl -s localhost:3490/v1/unpulsed | jq -r .keys_formatted
