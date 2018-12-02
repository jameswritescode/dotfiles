#!/bin/bash
# https://github.com/ranger/ranger/blob/master/ranger/data/scope.sh

set -o pipefail -o noglob

FILE_PATH="$1"
PV_WIDTH="$2"
# PV_HEIGHT="$3"
FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER=$(echo "$FILE_EXTENSION" | tr '[:upper:]' '[:lower:]')

handle_extension() {
  case "$FILE_EXTENSION_LOWER" in
    csv)
      csvtomd "$FILE_PATH" && exit 5
      exit 2
      ;;
    mysql)
      exit 1
      ;;
    pdf)
      mutool draw -F txt -i -- "$FILE_PATH" 1-10 | fmt -w "$PV_WIDTH" && exit 5
      ;;
  esac
}

handle_mime() {
  case "$(file --dereference --brief --mime-type -- "$FILE_PATH")" in
    audio/* | video/*)
      mediainfo "$FILE_PATH" && exit 5
      ;;
    image/*)
      exiftool "$FILE_PATH" && exit 5
      ;;
    text/* | */xml)
      highlight --out-format=xterm256 --force --style=moria "$FILE_PATH" \
        && exit 5
      exit 2
      ;;
  esac
}

handle_fallback() {
  echo '----- File Type Classification -----' \
    && file --dereference --brief -- "$FILE_PATH" \
    && exit 5

  exit 1
}

handle_extension
handle_mime
handle_fallback
