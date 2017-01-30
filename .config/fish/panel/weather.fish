#!/usr/bin/fish
set forecast (forecast "Uzhgorod" | grep '^[. +]' | sed "s/....//")
set celsius (echo $forecast | perl -n -e '/(\d+)/ && print "$1\n"')
set weather (echo $forecast | perl -n -e '/([a-zA-Z ]+)/ && print "$1\n"')
echo  $celsius $weather
