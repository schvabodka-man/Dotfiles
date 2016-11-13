#!/usr/bin/fish
if pgrep 'deadbeef' > /dev/null
  set deadbeef_song (deadbeef --nowplaying-tf "%artist% - %title%")
  echo ♬: $deadbeef_song
end
