#!/usr/bin/fish
set date (meetup-cli | grep "Date:" | perl -n -e '/ +Date: (.+)/ && print "$1\n"')
set counter (meetup-cli | grep "Date:" | wc -l)
echo   $counter — $date
