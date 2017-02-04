#!/usr/bin/fish
set artist (cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- | head -n 1)
set track (cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3-)
set number (cmus-remote -Q 2>/dev/null | grep tracknumber | cut -d " " -f 3-)
echo   $artist — $number. $track
