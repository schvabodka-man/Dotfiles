function cd
	builtin cd $argv
	ls
end

alias sloc 'cloc'

if test -e ~/bin/micro/micro
	alias micro '~/bin/micro/micro'
	alias nano 'micro'
end

alias j "z"

alias unmount 'umount'

alias find 'fd'

alias cp 'pycp'
alias mv 'pymv'

alias rm 'trash-put'
alias trash-ls 'trash-list'

if test -e /bin/colordiff
	alias diff 'colordiff'
end

#moar useful aliases
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias move 'mv'
alias lsa 'ls -a'
alias lsl 'ls -l --block-size=M'
