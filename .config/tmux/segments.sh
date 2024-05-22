#!/bin/bash

# export TMUX_THEME_SEGMENTS="spotify whatpulse"

# TODO can we make the clock a segment, but use tmux's formatting?
find_segment() {
  case "$1" in
    spotify)
      echo "#[fg=#a6e3a1] $("$DOTFILES"/.config/tmux/spotify.sh)"
    ;;

    whatpulse)
      echo "#[fg=#89b4fa] $("$DOTFILES"/.config/tmux/whatpulse.sh)"
    ;;

    *)
      echo "unknown segment ${1}"
    ;;
  esac
}

if [[ -n $TMUX_THEME_SEGMENTS ]]; then
  segments=""

  for segment in $TMUX_THEME_SEGMENTS; do
    segments="${segments}  $(find_segment "$segment")"
  done

  echo "$segments"
fi
