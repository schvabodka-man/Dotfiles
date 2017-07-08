#!/usr/bin/fish
echo  (docker exec -i weather-npm forecast | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g" | grep '^[. +]' | sed "s/....//" | sed 's/\.//g')
