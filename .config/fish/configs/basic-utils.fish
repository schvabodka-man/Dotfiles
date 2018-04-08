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

#better work with standart unix utils
alias tree 'alder'

if test -e ~/bin/ls-icons/binary/bin/ls
	alias ls "~/bin/ls-icons/binary/bin/ls"
end

# if test -e ~/.cargo/bin/fd
#	alias find '~/.cargo/bin/fd -H -I'
#	alias fd '~/.cargo/bin/fd -H -I'
# end

if test -e /usr/bin/fd
	alias find 'fd'
end

alias cp 'pycp'
alias mv 'pymv'

alias rm 'trash-put'
alias trash-ls 'trash-list'

if test -e /bin/colordiff
	alias diff 'colordiff'
end

function less
	if test -e /usr/share/source-highlight/src-hilite-lesspipe.sh
		/usr/share/source-highlight/src-hilite-lesspipe.sh $argv | /bin/less -R -N
	else
		/bin/less $argv
	end
end

function git
	#in some distros hub are hard to install
	if test -e /bin/hub
		hub $argv
	else
		/usr/bin/git $argv
	end
end

#moar useful aliases
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias move 'mv'
alias lsa 'ls -a'
alias lsl 'ls -l --block-size=M'
