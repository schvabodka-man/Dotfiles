#!/usr/bin/fish
builtin cd ~/Dropbox/todo
set calendar (cat todo.txt | grep due | wc -l)
echo  $calendar