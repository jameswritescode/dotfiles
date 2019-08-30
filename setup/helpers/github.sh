#!/bin/bash

getLatestReleaseURL() {
read -r -d '' GQL <<-GQL
  query LATEST_RELEASE_QUERY {
    repository(owner: \"$1\", name: \"$2\") {
      releases(last:1) {
        nodes {
          releaseAssets(first:100) {
            nodes {
              downloadUrl
            }
          }
        }
      }
    }
  }
GQL

read -r -d '' JSON <<-JSON
  {
    "query": "$(echo "$GQL" | tr -d '\n')"
  }
JSON

  curl \
    -H "Authorization: token $GITHUB_TOKEN" \
    -X POST \
    -d "$JSON" \
    --silent \
    https://api.github.com/graphql | \
  jq \
    -r \
    ".data.repository.releases.nodes[0].releaseAssets.nodes[] | select(.downloadUrl | contains(\"$3\")) | .downloadUrl"
}
