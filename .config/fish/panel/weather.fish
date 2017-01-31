#!/usr/bin/fish
set forecast (forecast "Uzhgorod" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g" | grep '^[. +]' | sed "s/....//" | sed 's/\.//g' )
echo  $forecast
