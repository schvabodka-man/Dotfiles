#!/usr/bin/fish
builtin cd ~/Dropbox/Org/Wiki/Agenda/Todo
set calendar (cat Calendar.org | grep TODO | wc -l)
echo  $calendar
