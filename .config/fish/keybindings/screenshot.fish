#!/usr/bin/fish
set active_window (xdotool getwindowfocus getwindowname)
scrot ~/Pictures/$active_window-%d-%b----%H:%M:%S.png
notify-send "Screenshot from $active_window taken"
