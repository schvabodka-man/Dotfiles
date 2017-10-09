#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
set -g theme_display_hg yes
#Homes!
set -x JAVA_HOME (which java)
set -x GRADLE_HOME (which gradle)
set -x GROOVY_HOME (which groovy)
set -x SCALA_HOME (which scala)
set -x GOPATH '/home/user/Go'
set -x LGOBIN '/home/user/Go/bin'
set -x ANDROID_HOME '/home/user/Android/Sdk'
set -x EDITOR "emacsclient -c"
set -x BROWSER "qutebrowser"
#colored man
set -x  LESS_TERMCAP_mb (tput bold; tput setaf 1)
set -x LESS_TERMCAP_md (tput bold; tput setaf 2)
set -x LESS_TERMCAP_me (tput sgr0)
set -x LESS_TERMCAP_so (tput bold; tput setaf 1; tput setab 7)
set -x LESS_TERMCAP_se (tput rmso; tput sgr0)
set -x LESS_TERMCAP_us (tput smul; tput bold; tput setaf 7)
set -x LESS_TERMCAP_ue (tput rmul; tput sgr0)
set -x LESS_TERMCAP_mr (tput rev)
set -x LESS_TERMCAP_mh (tput dim)
set -x LESS_TERMCAP_ZN (tput ssubm)
set -x LESS_TERMCAP_ZV (tput rsubm)
set -x LESS_TERMCAP_ZO (tput ssupm)
set -x LESS_TERMCAP_ZW (tput rsupm)
set -x GROFF_NO_SGR 1
set -x FZF_DEFAULT_OPTS "--preview '/usr/bin/src-hilite-lesspipe.sh {}' \
--bind 'enter:execute(emacsclient -c {})+abort,\
ctrl-y:execute(echo {} | xclip -selection clipboard)+abort,\
ctrl-c:execute(cat {} | xclip -selection clipboard)+abort,\'"

#shell bookmarks
if test -e ~/.fishmarks/marks.fish
	. ~/.fishmarks/marks.fish
end

source ~/.config/fish/panel.fish

if test -e ~/.local/share/icons-in-terminal/icons.fish
	source ~/.local/share/icons-in-terminal/icons.fish
end

if test -e ~/bin/pip-fish/pip.fish
	source ~/bin/pip-fish/pip.fish
end

if test -e ~/bin/docker-fish/docker.fish
	source ~/bin/docker-fish/docker.fish
end

if test -e ~/bin/docker-fish/docker-compose.fish
	source ~/bin/docker-fish/docker-compose.fish
end

if test -e ~/bin/hub-fish/hub.fish
	source ~/bin/hub-fish/hub.fish
end

if test -e ~/bin/up/up.fish
	source ~/bin/up/up.fish
	alias cd.. 'up' #priceless
	alias .. 'up'
end

if test -e ~/bin/transfersh/transfer.fish
	source ~/bin/up/up.fish
	source ~/bin/transfersh/transfer.fish
	alias upload 'transfer'
end

if test -e /usr/local/bin/grc
	source ~/.config/fish/grc-cleaned.fish
else if test -e /bin/grc
	source ~/.config/fish/grc-cleaned.fish
end

# Custom alias for listing files when moving to directory
function cd
	builtin cd $argv
	ls -a
end

#docker shitty aliases
function docker-kill
	docker stop $argv > /dev/null
	docker rm $argv > /dev/null
end

alias steam 'flatpak run com.valvesoftware.Steam'
alias skype 'flatpak run com.skype.Client'
alias ppsspp 'flatpak run org.ppsspp.PPSSPP'
alias retroarch 'flatpak run org.libretro.RetroArch'

if test -e /bin/cloc
	alias sloc 'cloc'
end

if test -e ~/Go/bin/gopm
	alias gopm '~/Go/bin/gopm'
end

alias j "z"

#better work with standart unix utils
if test -e /bin/alder
	alias tree 'alder'
end

if test -e /bin/pycp
	alias cp 'pycp'
	alias mv 'pymv'
end

if test -e /bin/trash-put
	alias rm 'trash-put'
end

alias cat 'bcat'

if test -e ~/bin/ls-icons/binary/bin/ls
	alias ls '~/bin/ls-icons/binary/bin/ls --color'
end

if test -e ~/bin/ls-icons/binary/bin/dir
	alias dir '~/bin/ls-icons/binary/bin/dir --color'
end

if test -e /bin/colordiff
	alias diff 'colordiff'
end

function less
	if test -e /usr/bin/src-hilite-lesspipe.sh
		/usr/bin/src-hilite-lesspipe.sh $argv | /bin/less -R -N
	else
		/bin/less $argv
	end
end

function git
	#in some distros hub are hard to install
	if test -e /bin/hub
		hub $argv
	else
		/bin/git $argv
	end
end

#sql wrappers
if test -e /bin/mycli
	alias mysql 'mycli'
end

if test -e /bin/pgcli
	alias postgres 'pgcli'
	alias postgresql 'pgcli'
	alias pgsql 'pgcli'
	alias psql 'pgcli'
end

if test -e ~/bin/fzf/bin/fzf
	alias fzf "~/bin/fzf/bin/fzf"
	alias search 'fzf'
end

#aliases for creating projects
alias project 'touch .projectile'
function project-js
	touch .indium
	touch .projectile
	touch .tern-project
	touch .csswatcher
	echo "{
	\"libs\": [
	\"browser\",
	\"jquery\",
	\"express\",
	\"prism\"
	],
	\"plugins\": {
	\"node\": {}
	}
	}" >> .tern-project
end
alias project-javascript 'project-js'
alias javascript-project 'project-js'
alias js-project 'project-js'

#moar useful aliases
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias move 'mv'
alias copy 'cp'
alias lsa 'ls -a'
alias emacs 'emacsclient -nw'
alias emacs-daemon '/usr/bin/emacs --daemon'

#pandoc macro
function html-to-pdf
	pandoc -S (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').html -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').pdf
end
function html-to-docx
	pandoc -S (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').html -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').docx
end
function markdown-to-pdf
	pandoc -S (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').md -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').pdf
end
function markdown-to-docx
	pandoc -S (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').md -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').docx
end
alias html-to-doc 'html-to-docx'
alias markdown-to-doc 'markdown-to-docx'
alias md-to-doc 'markdown-to-docx'
alias md-to-docx 'markdown-to-docx'
alias md-to-pdf 'markdown-to-pdf'

#gpg
function export-key
	gpg2 --export-secret-key $argv --armor > $argv.asc
end
alias gpg-export-key 'export-key'

function encrypt
	gpg2 -e -r $argv[1] $argv[2]
end
alias gpg-encrypt 'encrypt'
alias gpg2-encrypt 'encrypt'

function decrypt
	gpg2 -d $argv
end
alias gpg-decrypt 'decrypt'
alias gpg2-decrypt 'decrypt'

#tmux
function tmux-new
	tmux new -s $argv -d $argv
end
function tmux-attach
	tmux attach-session -t $argv
end
alias tmux-config-update "tmux source ~/.config/tmux/tmux.conf"
alias tmux-update-config "tmux source ~/.config/tmux/tmux.conf"

alias chromium-debug "chromium-browser --disable-gpu --remote-debugging-port=9222 https://localhost:3000"

function git-remote
	git remote remove origin
	git remote add origin $argv
end
function git-squash
	git reset --soft HEAD~$argv
	git commit -m 'Squashed last $argv commits'
end

set -U fish_key_bindings fish_default_key_bindings

function nothing
end

function fish_user_key_bindings

	# bind / __fish_toggle_comment_commandline
	bind \ms sudope

	bind \ck backward-kill-line
	bind \ek kill-line

	bind [H beginning-of-line
	bind [F end-of-line

	# bind -m insert \t force-repaint
	# bind -m insert -k backspace backward-delete-char
	# bind -k backspace backward-delete-char
	# bind -M insert -m default \e force-repaint

	# # bind k backward-delete-char
	# bind K delete-char
	# bind kw backward-kill-bigword
	# bind kW kill-bigword
	# bind kb backward-kill-line
	# bind ks backward-kill-line
	# bind kh backward-kill-line
	# bind ke kill-line
	bind -e d
	bind -e D
	bind -e dw
	bind -e dW
	bind -e db
	bind -e ds
	bind -e dh
	bind -e de

	bind \x08 backward-kill-bigword
	bind \[3\;5~ kill-bigword

	#new line
	bind \e\n commandline\ -i\ \\n
	bind \e\r commandline\ -i\ \\n

	#unbind useless shit
	bind -e \cu
	bind -e \cs
	bind -e \e\[H
	bind -e \e\[F
	bind -e \e\[1\~
	bind -e \e\[4\~
	bind -e \cy
	bind -e \ed
	bind -e \cd
	bind -e -k
	bind -e \eh
	bind -e \ep
	bind -e \e\[I
	bind -e \e\[O
	bind -e \e\#
	bind -e -k ppage
	bind -e -k npage
	bind -e \e\<
	bind -e \e\>

	bind -e -M visual '$'
	bind -e -M visual 'g$'
	bind -e -M visual \e\[F
	bind -e -M visual '^'
	bind -e -M visual 0
	bind -e -M visual 'g^'
	bind -e -M visual \e\[H

	bind -e -M insert \ck
	bind -e -M insert \cy
	bind -e -M insert \e\#
	bind -e -M insert \n
	bind -e -m insert \n

	bind -e -M visual b
	bind -e -M visual B
	bind -e -M visual ge
	bind -e -M visual gE
	bind -e -M visual w
	bind -e -M visual W
	bind -e -M visual e
	bind -e -M visual E

	bind -e -k up
	bind -e -k down
	bind -e -M visual -k up
	bind -e -M visual -k down
	bind -e -M insert -k up
	bind -e -M insert -k down

	bind -e :q
	bind -e h
	bind -e l
	bind -e -m insert I
	bind -e -m insert a
	bind -e -m insert A
	bind -e gg
	bind -e G
	bind -e '$'
	bind -e 'g$'
	bind -e '^'
	bind -e 0
	bind -e 'g^'
	bind -e u
	bind -e \cr
	bind -e '['
	bind -e ']'
	bind -e k
	bind -e j
	bind -e b
	bind -e B

	bind -e gu
	bind -e gU
	bind -e J
	bind -e K
	bind -e yy
	bind -e Y
	bind -e 'y$'
	bind -e 'y^'
	bind -e yw
	bind -e yW
	bind -e yiw
	bind -e yiW
	bind -e yaw
	bind -e yaW
	bind -e ye
	bind -e yE
	bind -e yb
	bind -e yB
	bind -e yge
	bind -e ygE
	bind -e j
	bind -e b
	#unbind i and v
	bind -e -m visual v
	bind -e -m insert i

	bind -e '~'
	bind -e f
	bind -e F
	bind -e t
	bind -e T
	bind -e p
	bind -e P
	bind -e gp

	bind -e diw
	bind -e diW
	bind -e daw
	bind -e daW

	bind -e ge
	bind -e gE
	bind -e w
	bind -e W
	bind -e e
	bind -e E
	bind -e x
	bind -e X
	bind -e dd
	bind -e D
	bind -e 'd$'
	bind -e 'd^'
	bind -e dge
	bind -e dgE

	bind -e -M insert \cd
	bind -e -M insert -k f1
	bind -e -M insert \eh
	bind -e -M insert \ep

	bind -e -M insert \cl
	bind -e -M insert \cc
	bind -e -M insert \cu
	bind -e -M insert \cw

	bind -e -m insert S
	bind -e -m insert cc
	bind -e -m insert C
	bind -e -m insert 'c$'
	bind -e -m insert 'c^'
	bind -e -m insert cw
	bind -e -m insert cW
	bind -e -m insert ciw
	bind -e -m insert ciW
	bind -e -m insert caw
	bind -e -m insert caW
	bind -e -m insert ce
	bind -e -m insert cE
	bind -e -m insert cb
	bind -e -m insert cB
	bind -e -m insert cge
	bind -e -m insert cgE
	bind -e -M insert \cx

	bind -e -M insert \cp
	bind -e -M insert \cn
	bind -e \cp
	bind -e \cn

	bind -e -M insert \ca
	bind -e -M insert \ce
	bind -e -M insert \ey
	bind -e -M insert \b
	bind -e -M insert \cf
	bind -e -M insert \cb
	bind -e -M insert \ct
	bind -e -M insert \et
	bind -e -M insert \eu
	bind -e -M insert \ec
	bind -e -M insert \eb
	bind -e -M insert \ef
end

# trap 'tmux kill-session' EXIT
