#!/usr/bin/fish
amixer -q sset Master 3%+
notify-send -t 500 "Increased volume by 3%"
