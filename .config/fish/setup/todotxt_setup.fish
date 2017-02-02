#!/usr/bin/fish
echo "todo.txt"
sudo dnf install php
sudo dnf install php-mbstring
builtin cd ~/bin
git clone https://github.com/onovy/otodo.git
mkdir /home/user/.config/todo.txt/
