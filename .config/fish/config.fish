#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
#aliases
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias rofi-cache-clear 'rm ~/.cache/rofi-3.runcache'
alias newsbeuter-cache-clear 'rm ~/.newsbeuter/cache.db'
alias cd.. 'cd ..' #priceless
alias rm 'rm -rf'
alias lsa 'ls -a'

# Custom alias for listing files when moving to directory
function cd
  builtin cd $argv
  ls -a
end

#gpg
function export-key
  gpg2 --export-secret-key $argv --armor > $argv.asc
end

#todo list
function todo
  builtin cd /home/user/bin/otodo/
  ./otodo /home/user/.config/todo.txt/config.ini
end

#autojump
set --global AUTOJUMP_PATH /usr/share/autojump/autojump.fish
  if test -e $AUTOJUMP_PATH
  source $AUTOJUMP_PATH
end
