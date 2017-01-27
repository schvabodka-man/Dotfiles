#!/usr/bin/fish
set active_window (xdotool getwindowfocus getwindowname)
cd ~/Pictures/Screenshots
if test -d $active_window
    #do nothing
else
    mkdir $active_window
end
scrot ~/Pictures/Screenshots/$active_window/%d-%b----%H:%M:%S.png
notify-send "Screenshot from $active_window taken"