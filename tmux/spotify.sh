MAXLEN=30
playing=$(osascript "$DOTFILES/tmux/spotify.applescript" | tr -d '\n')

if [ ${#playing} -gt $MAXLEN ]; then
  echo "$(echo "$playing" | cut -c -$MAXLEN)..."
else
  echo "$playing"
fi
