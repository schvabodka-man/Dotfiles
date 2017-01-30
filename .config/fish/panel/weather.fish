#!/usr/bin/fish
set forecast (forecast "Uzhgorod" | tr -d "°" | grep '^[. +]' | sed "s/....//" | sed 's/\.//g' )
echo  $forecast
