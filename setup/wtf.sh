#!/bin/bash

read -r -d '' GQL <<-GQL
  query LATEST_RELEASE_QUERY {
    repository(owner: \"wtfutil\", name: \"wtf\") {
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

getLatestReleaseURL() {
  curl \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -X POST \
    -d "$JSON" \
    --silent \
    https://api.github.com/graphql | \
  jq \
    -r \
    '.data.repository.releases.nodes[0].releaseAssets.nodes[] | select(.downloadUrl | contains("darwin_amd64")) | .downloadUrl'
}

pushd /tmp || exit
  wget "$(getLatestReleaseURL)"
  tar zxf wtf_*.gz

  pushd wtf_*/ || exit
    mv wtf /usr/local/bin
  popd || exit

  rm -rf wtf_*
popd || exit

mkdir -p "$HOME/.config/wtf"
ln -s "$DOTFILES/wtf.yml" "$HOME/.config/wtf/config.yml"
