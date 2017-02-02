#!/usr/bin/fish
set icon /home/user/Pictures/icons/sound-off.svg
pactl set-sink-mute 0 toggle
notify-send -i $icon "MUTED $volume"
