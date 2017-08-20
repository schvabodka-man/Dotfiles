#!/usr/bin/fish
builtin cd ~/.password-store
fzf --ansi --inline-info --multi --history=/home/user/.config/fzf/history --preview="cat {}" > .found
set passfile (cat .found | perl -n -e '/(.+).gpg/ && print "$1\n"')
rm .found
pass $passfile
