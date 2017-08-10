#!/usr/bin/fish
builtin cd ~/Dropbox/Org/Wiki/Todo
set calendar (cat Calendar.org | grep TODO | wc -l)
echo  $calendar
