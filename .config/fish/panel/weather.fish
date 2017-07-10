#!/usr/bin/fish
docker stop weather-npm > /dev/null
docker rm weather-npm > /dev/null
echo  (docker run --name weather-npm -t scvh.com/weather-npm "Uzhgorod" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g" | grep '^[. +]' | sed "s/....//" | sed 's/\.//g')
