#!/usr/bin/fish
set battery (upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o '[^ ]*%' | sed 's/%//')
if test $battery -le 15
  ntfy -c /home/scvh/.config/ntfy/laptop_low_battery_smartphone.yaml -t Laptop send 'battery is low'
end
echo " " #костыль созданный для выпиливания выхлопа
