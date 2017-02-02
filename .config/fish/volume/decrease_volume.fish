#!/usr/bin/fish
set icon /home/user/Pictures/icons/sound.svg
pactl set-sink-volume 0 -5% #decrease sound volume
set volume (amixer get Master | grep -E -o '[0-9]{1,3}?%' | head -1)
notify-send -i $icon "$volume"
