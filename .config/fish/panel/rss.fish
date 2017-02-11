#!/usr/bin/fish
set unread (newsbeuter -x print-unread | perl -n -e '/(\d+) unread articles/ && print "$1\n"')
echo  $unread
