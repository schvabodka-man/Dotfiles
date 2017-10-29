#!/usr/bin/fish
amixer -q sset Master 3%-  #decrease sound volume
notify-send -t 500 "Decreased volume by 3%"
