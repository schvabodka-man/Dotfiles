#!/usr/bin/fish
set iconmuted /home/user/Pictures/icons/sound-off.svg
set icon /home/user/Pictures/icons/sound.svg
pactl set-sink-mute 0 toggle
set amixerstdout (amixer get Master | perl -n -e '/\[(\w+)\]/ && print "$1\n"' | head -n 1) #i'm parsing only first line because simply if you have one audio device enabled every else is enabled too
if [ $amixerstdout = "off" ]
  notify-send -i $iconmuted "MUTED"
else
  set volume (amixer get Master | grep -E -o '[0-9]{1,3}?%' | head -1)
  notify-send -i $icon "$volume"
end
