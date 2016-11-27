#!/usr/bin/fish
set battery (upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -o '[^ ]*%' | sed 's/%//')
set checkerboolean (cat /home/scvh/logs/pushbullet_laptop_notification.log) #this variable is created to prevent doubling of notifications
if test $battery -gt 15
  echo '0' > /home/scvh/logs/pushbullet_laptop_notification.log #when the battery is charged its set variable to false
end
if test $battery -le 15; and test $checkerboolean -eq 0
  ntfy -c /home/scvh/.config/ntfy/laptop_low_battery_smartphone.yaml -t Laptop send 'battery is low'
  echo '1' > /home/scvh/logs/pushbullet_laptop_notification.log #it's set variable to true so push will note be send more than one time
end
echo " " #костыль созданный для выпиливания выхлопа
