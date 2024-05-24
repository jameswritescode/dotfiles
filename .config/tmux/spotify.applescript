tell application "System Events"
  set myList to (name of every process)
end tell

if myList contains "Spotify" then
  tell application "Spotify"
    if player state is stopped then
      set output to "Stopped"
    else
      if player state is paused then
        set output to "Paused"
      else
        set track_artist to current track's artist
        set track_name to current track's name
        set output to track_name & " - " & track_artist
      end if
    end if
  end tell
else
  set output to "Offline"
end if
