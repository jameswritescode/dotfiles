#!/bin/bash

chars=('\' '|' '/' '-')
end_char=$((${#chars[@]}-1))
current=0
LOADING=true

while $LOADING; do
  gecho -ne "${chars[current]} Initializing...\r"
  current=$((current+1))

  if [[ $current -gt $end_char ]]; then
    current=0
  fi

  if ! [[ $LOADING ]]; then
    break
  fi

  sleep 0.05
done

gecho -e "\nLoaded"
