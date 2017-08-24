#!/usr/bin/fish
builtin cd ~/Dropbox/Org/Wiki/Agenda/Todo
set todo (cat Todo.org | grep TODO | wc -l)
echo  $todo
