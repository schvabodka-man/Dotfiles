#!/usr/bin/fish
set meetups (meetup-cli)
set date (echo $meetups | grep "Date:" | perl -n -e '/ +Date: (.+)/ && print "$1\n"')
set counter (echo $meetups | grep "Date:" | wc -l)
set fancy_date (echo $date | perl -n -e '/\w.+, (\d+ \w+ \d+ \d+:\d+)/ && print "$1\n"')
echo   $counter — $fancy_date
