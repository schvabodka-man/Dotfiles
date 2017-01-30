#!/usr/bin/fish
set artist (qdbus org.mpris.clementine /Player org.freedesktop.MediaPlayer.GetMetadata | grep artist | sed 's/artist: //')
set track (qdbus org.mpris.clementine /Player org.freedesktop.MediaPlayer.GetMetadata | grep title | sed 's/title: //')
echo ♬: $artist - $track
