on escape_quotes(string_to_escape)
  set AppleScript's text item delimiters to the "\""
  set the item_list to every text item of string_to_escape
  set AppleScript's text item delimiters to the "\\\""
  set string_to_escape to the item_list as string
  set AppleScript's text item delimiters to ""
  return string_to_escape
end escape_quotes

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
        -- set track_album to my escape_quotes(current track's album)
        set track_artist to my escape_quotes(current track's artist)
        set track_name to my escape_quotes(current track's name)
        set output to track_name & " - " & track_artist

        set output to output
      end if
    end if
  end tell
else
  set output to "Offline"
end if
