#!/usr/bin/fish
echo  (/usr/bin/forecast "Uzhgorod" | sed -r "s/\x1B\[[0-9;]*[a-zA-Z]//g" | grep '^[. +]' | sed "s/....//" | sed 's/\.//g')
