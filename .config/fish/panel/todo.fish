#!/usr/bin/fish
builtin cd ~/Dropbox/todo
set todo (cat todo.txt | grep -v due | grep "^[^x;]" | wc -l)
echo  $todo
