#!/usr/bin/fish
set deadbeef_song (deadbeef --nowplaying-tf "%artist% - %title%")
echo ♬: $deadbeef_song
