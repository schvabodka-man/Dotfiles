#!/usr/bin/fish
builtin cd ~/Dropbox/todo
set calendar (cat todo.txt | grep due | grep "^[^x;]" | wc -l)
echo  $calendar
