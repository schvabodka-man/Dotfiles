#!/usr/bin/fish
set artist (cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- | head -n 1)
set track (cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3-)
set number (cmus-remote -Q 2>/dev/null | grep tracknumber | cut -d " " -f 3-)
set stat (cmus-remote -Q 2>/dev/null | grep status | perl -n -e '/status (.+)/ && print "$1\n"')
if [ "$stat" = "stopped" ]
  echo  $artist — $number. $track
else if [ "$stat" = "playing" ]
  echo  $artist — $number. $track
else if [ "$stat" = "paused" ]
  echo  $artist — $number. $track
else
  echo  —
end
