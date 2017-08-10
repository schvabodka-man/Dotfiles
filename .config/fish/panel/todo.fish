#!/usr/bin/fish
builtin cd ~/Dropbox/Org/Wiki/Todo
set todo (cat Todo.org | grep TODO | wc -l)
echo  $todo
