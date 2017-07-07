#!/usr/bin/fish
set local(docker exec -i weather-npm forecast "Uzhgorod")
set forecast (echo $local | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g" | grep '^[. +]' | sed "s/....//" | sed 's/\.//g' )
echo  $forecast
