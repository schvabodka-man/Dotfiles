#!/usr/bin/fish
set forecast (forecast "Uzhgorod" | grep '^[. +]' | sed "s/....//")
echo  $forecast
