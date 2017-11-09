#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
set -g theme_display_hg yes
#Homes!
set -x JAVA_HOME '/usr/lib/jvm/java-1.8.0-openjdk'
set -x GOPATH '/home/user/Go'
set -x LGOBIN '/home/user/Go/bin'
set -x ANDROID_HOME '/home/user/Android/Sdk'
set -x EDITOR "emacsclient -c"
set -x BROWSER "vivaldi"
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
ctrl-c:execute(cat {} | xclip -selection clipboard)+abort'"
set -x PATH ~/.cargo/bin/ $PATH

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
	source ~/bin/transfersh/transfer.fish
	alias upload 'transfer'
end

if test -e /usr/local/bin/grc
	or test -e /bin/grc
	# alias cvs 'grc cvs'
	# alias df 'grc df'
	# alias dnf 'grc dnf'
	alias dig 'grc dig'
	alias gcc 'grc gcc'
	alias g++ 'grc g++'
	alias ifconfig 'grc ifconfig'
	alias make 'grc make'
	alias mount 'grc mount'
	# alias mtr 'grc mtr'
	alias netstat 'grc netstat'
	alias ping 'grc ping'
	alias ps 'grc ps'
	# alias tail 'grc tail'
	# alias traceroute 'grc traceroute'
	# alias wdiff 'grc wdiff'
	# alias blkid 'grc blkid'
	# alias du 'grc du'
	alias docker 'grc docker'
	# alias docker-machine 'grc docker-machine'
	alias env 'grc env'
	alias id 'grc id'
	# alias ip 'grc ip'
	# alias iostat 'grc iostat'
	# alias last 'grc last'
	# alias lsattr 'grc lsattr'
	# alias lsblk 'grc lsblk'
	# alias lspci 'grc lspci'
	# alias lsmod 'grc lsmod'
	# alias lsof 'grc lsof'
	# alias getfacl 'grc getfacl'
	# alias getsebool 'grc getsebool'
	# alias ulimit 'grc ulimit'
	alias uptime 'grc uptime'
	# alias nmap 'grc nmap'
	# alias fdisk 'grc fdisk'
	# alias findmnt 'grc findmnt'
	# alias free 'grc free'
	# alias semanage 'grc semanage'
	# alias sar 'grc sar'
	# alias ss 'grc ss'
	alias sysctl 'grc sysctl'
	alias systemctl 'grc systemctl'
	# alias stat 'grc stat'
	# alias showmount 'grc showmount'
	# alias tune2fs 'grc tune2fs'
	# alias tcpdump 'grc tcpdump'
	# alias tune2fs 'grc tune2fs'
	# alias vmstat 'grc vmstat'
	# alias w 'grc w'
	alias who 'grc who'
end

# Custom alias for listing files when moving to directory
function cd
	builtin cd $argv
	if test (/bin/ls -a | wc -l) -lt 300
		lsa
	end
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

if test -e ~/bin/micro/micro
	alias micro '~/bin/micro/micro'
	alias nano 'micro'
end

if test -e ~/Go/bin/gopm
	alias gopm '~/Go/bin/gopm'
end

if test -e ~/.sdkman/candidates/leiningen/current/bin/lein
	alias lein ~/.sdkman/candidates/leiningen/current/bin/lein
end

alias j "z"

#better work with standart unix utils
if test -e /bin/alder
	alias tree 'alder'
end

if test -e ~/.cargo/bin/fd
	alias find '~/.cargo/bin/fd -H -I'
end

if test -e /bin/pycp
	alias cp 'pycp'
	alias mv 'pymv'
end

if test -e /bin/trash-put
	alias rm 'trash-put'
end

alias cat 'bcat'

alias ls 'colorls'

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

function aria-local
	~/bin/aria2rpc/aria2rpc addUri $argv -d ~/Downloads
end
alias download-local "aria-local"
alias aria2-local "download-local"
alias aria-list-local "~/bin/aria2rpc/aria2rpc tellActive"
alias aria2-list-local "aria-list-local"
alias download-list-local "aria-list-local"
alias downloads-list-local "aria-list-local"
alias downloads-local "aria-list-local"
alias aria-pause-local "~/bin/aria2rpc/aria2rpc pause"
alias aria2-pause-local "aria-pause-local"
alias download-pause-local "aria-pause-local"
alias aria-stop-local "~/bin/aria2rpc/aria2rpc remove"
alias aria2-stop-local "aria-stop-local"
alias download-stop-local "aria-stop-local"
alias aria-remove-local "aria-stop-local"
alias aria-status-local "~/bin/aria2rpc/aria2rpc tellStatus"
alias aria2-status-local "aria-status-local"
alias download-status-local "aria-status-local"
alias aria-unpause-local "~/bin/aria2rpc/aria2rpc tellUnpause"
alias aria2-unpause-local "aria-unpause-local"
alias download-unpause-local "aria-unpause-local"
alias aria-resume-local "aria-unpause-local"
alias aria2-resume-local "aria-unpause-local"
alias download-resume-local "aria-unpause-local"
alias aria-resume-local "aria-unpause-local"
alias aria2-continue-local "aria-unpause-local"
alias aria2-continue-local "aria-unpause-local"
alias download-continue-local "aria-unpause-local"

alias calc 'octave-cli'
alias calculator 'octave-cli'

alias screencast-asciinema "asciinema rec -w4"
alias asciinema-screencast "screencast-asciinema"
alias record-asciinema "screencast-asciinema"
alias asciinema-record "screencast-asciinema"

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

alias fzf "~/bin/fzf/bin/fzf"
alias search 'fzf'

#aliases for creating projects
alias project 'touch .projectile'
function project-js
	touch .indium
	touch .projectile
	touch .tern-project
	touch .csswatcher
	echo "{	}" >> .tern-project
	# echo "{
	# \"libs\": [
	# \"browser\",
	# \"jquery\",
	# \"express\",
	# \"prism\"
	# ],
	# \"plugins\": {
	# \"node\": {}
	# }
	# }" >> .tern-project
end
alias project-javascript 'project-js'
alias javascript-project 'project-js'
alias js-project 'project-js'

#currently only for scala
function project-android
	touch .projectile
	echo -n "Api level: "
	read apilevel
	echo -n "App name: "
	read appname
	sbt "gen-android android-$apilevel com.scvh.apps $appname"
end

#moar useful aliases
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias move 'mv'
alias copy 'cp'
alias lsa 'ls -a'
alias lsl 'ls -l --block-size=M'

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

function git-smart-gui
	if count $argv > /dev/null
		if git branch --list -a | grep $argv > /dev/null
			gitk $argv
		else if git ls | grep $argv > /dev/null
			gitk --all $argv
		else
			gitk $argv
		end
	else
		gitk --all
	end
end

function zip
	for arg in argv
		/bin/zip -r $arg.zip $arg
	end
end

function wifi-list
	nmcli dev wifi rescan > /dev/null
	nmcli dev wifi list
end

function wifi-connect
	nmcli dev wifi rescan > /dev/null
	nmcli dev wifi connect $argv
end

alias wifi-ls "wifi-list"
alias wifi-on "nmcli radio wifi on"
alias wifi-off "nmcli radio wifi off"

alias music-import 'import-music'

function weather
	curl wttr.in/"uzhgorod"
end
alias forecast 'weather'

alias screenshot 'scrot'

alias lock 'i3lock -c "0e1112"'
alias desktop-lock 'lock'
alias lock-desktop 'lock'

#without sourcing works faster
function tmux-alternative-right
	echo "#[fg=colour126,bg=default] #[fg=default,bg=colour126] #H"
end

set -U fish_key_bindings fish_default_key_bindings

function fish_user_key_bindings

	#unbind useless shit
	bind -e \cu
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

	bind -e \ca
	bind -e \ce
	bind -e \ey
	bind -e \b
	bind -e \cf
	bind -e \cb
	bind -e \ct
	bind -e \ec
	bind -e \et
	bind -e \eu
	bind -e \e
	bind -e \eb
	bind -e \ef

	bind -e :q
	bind -e h
	bind -e l
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

	bind \ck backward-kill-line
	bind \ek kill-line

	bind [1~ beginning-of-line
	bind [4~ end-of-line

	bind \x08 backward-kill-bigword
	bind \[3\;5~ kill-bigword

	#new line
	bind \e\n commandline\ -i\ \\n
	bind \e\r commandline\ -i\ \\n

	#i don't want to change keycodes in st config
	bind \x1b\x4f\x44 backward-word
	bind \x1b\x4f\x43 forward-word
	bind \[1\;5D backward-word
	bind \[1\;5C forward-word

	bind \x1b\x2f __fish_toggle_comment_commandline
end

function fish_title
	true
end
