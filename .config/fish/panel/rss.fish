#!/usr/bin/fish
set unread (newsbeuter -x print-unread)
set parseit (echo $unread | perl -n -e '/(\d+) unread articles/ && print "$1\n"') #that's dirty hack but it works at all
builtin cd ~/.newsbeuter
rm cache.db
echo  $parseit
