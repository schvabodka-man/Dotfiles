#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
set -g theme_display_hg yes
set -g theme_display_cmd_duration yes
set -g theme_show_exit_status yes
set -x user (set -x TLDR_COLOR_BLANK "white"
set -x TLDR_COLOR_BLANK "white"
set -x TLDR_COLOR_NAME "cyan"
set -x TLDR_COLOR_DESCRIPTION "white"
set -x TLDR_COLOR_EXAMPLE "green"
set -x TLDR_COLOR_COMMAND "red"
set -x TLDR_COLOR_PARAMETER "white"
set -x TLDR_CACHE_ENABLED "1"
set -x TLDR_CACHE_MAX_AGE "720"
whoami)
set -x GOPATH "/home/$user/Go"
set -x LGOBIN "/home/user/Go/bin"
set -x EDITOR "emacs-client"
set -x BROWSER "qutebrowser"
#clipboard managwe
set -x CM_LAUNCHER 'rofi'
#colored man
set -x LESS_TERMCAP_mb (tput bold; tput setaf 1)
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

if test -e ~/bin/git-flow-fish/git.fish
	source ~/bin/git-flow-fish/git.fish
end

source ~/.config/fish/startup.fish

if test -e ~/bin/up/up.fish
	source ~/bin/up/up.fish
	alias cd.. 'up' #priceless
	alias .. 'up'
end

#alias df "/usr/bin/grc df"
#alias dig "/usr/bin/grc dig"
#alias gcc "/usr/bin/grc gcc"
#alias g++ "/usr/bin/grc g++"
#alias ifconfig "/usr/bin/grc ifconfig"
#alias make "/usr/bin/grc make"
#alias mount "/usr/bin/grc mount"
#alias netstat "/usr/bin/grc netstat"
#alias ping "/usr/bin/grc ping"
#alias ps "/usr/bin/grc ps"
#alias docker "/usr/bin/grc docker"
#alias env "/usr/bin/grc env"
#alias id "/usr/bin/grc id"
#alias uptime "/usr/bin/grc uptime"
#alias sysctl "/usr/bin/grc sysctl"
#alias systemctl "/usr/bin/grc systemctl"
#alias who "/usr/bin/grc who"

# Custom alias for listing files when moving to directory
function cd
	builtin cd $argv
	ls
end

#docker shitty aliases
function docker-kill
	docker stop $argv > /dev/null
	docker rm $argv > /dev/null
end

alias sloc 'cloc'

if test -e ~/bin/micro/micro
	alias micro '~/bin/micro/micro'
	alias nano 'micro'
end

alias gopm '~/Go/bin/gopm'
alias lein ~/.sdkman/candidates/leiningen/current/bin/lein

alias j "z"

alias unmount 'umount'

#better work with standart unix utils
alias tree 'alder'

if test -e ~/.cargo/bin/fd
	alias find '~/.cargo/bin/fd -H -I'
	alias fd '~/.cargo/bin/fd -H -I'
end

alias cp 'pycp'
alias mv 'pymv'

alias rm 'trash-put'
alias trash-ls 'trash-list'

# function ls
#	if test -e ~/bin/ls-icons/binary/bin/ls
#		~/bin/ls-icons/binary/bin/ls $argv
#	else if test -e /usr/local/bin/colorls
#		colorls $argv
#	else
#		/bin/ls $argv
#	end
# end

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

if test -e /usr/bin/proxychains
	alias proxy 'proxychains'

	alias curl 'proxychains /usr/bin/curl'
	alias wget 'proxychains /usr/bin/wget'
	alias yadm 'proxychains /usr/bin/yadm'
	alias ssh 'proxychains /usr/bin/ssh'
	alias w3m 'proxychains /usr/bin/w3m'
	alias telnet 'proxychains /usr/bin/telnet'
	alias gem 'proxychains gem'
	alias luarocks 'proxychains luarocks'
	alias pip 'proxychains pip'
	alias pip3 'proxychains pip3'
	alias npm 'proxychains npm'
	alias cpan 'proxychains cpan'
	alias cabal 'proxychains cabal'
	alias gopm 'proxychains ~/Go/bin/gopm'
	alias omf 'proxychains omf'
	alias sudo-gem 'sudo proxychains gem'
	alias sudo-luarocks 'sudo proxychains luarocks'
	alias sudo-pip 'sudo proxychains pip'
	alias sudo-pip3 'sudo proxychains pip3'
	alias sudo-npm 'sudo proxychains npm'
	alias sudo-cpan 'sudo proxychains cpan'
	alias sudo-cabal 'sudo proxychains cabal'
	alias sudo-gopm 'sudo proxychains ~/Go/bin/gopm'
	alias sudo-omf 'sudo proxychains omf'
	alias apt-get 'proxychains /usr/bin/apt-get'
	alias apt-cache 'proxychains /usr/bin/apt-cache'
	alias sudo-curl 'sudo proxychains /usr/bin/curl'
	alias sudo-wget 'sudo proxychains /usr/bin/wget'
	alias sudo-telnet 'sudo proxychains /usr/bin/telnet'
	alias sudo-apt-get 'sudo proxychains /usr/bin/apt-get'
	alias sudo-apt-cache 'sudo proxychains /usr/bin/apt-cache'

	alias gem-no-proxy '/usr/bin/gem'
	alias luarocks-no-proxy '/usr/bin/luarocks'
	alias pip-no-proxy '/usr/bin/pip'
	alias pip3-no-proxy '/usr/bin/pip3'
	alias npm-no-proxy '/usr/bin/npm'
	alias cpan-no-proxy '/usr/bin/cpan'
	alias cabal-no-proxy '/usr/bin/cabal'
	alias gopm-no-proxy '~/Go/bin/gopm'
	alias git-no-proxy '/usr/bin/git'
	alias yadm-no-proxy '/usr/bin/yadm'
	alias wget-no-proxy '/usr/bin/wget'
	alias telnet-no-proxy '/usr/bin/telnet'
	alias curl-no-proxy '/usr/bin/curl'
	alias apt-get-no-proxy '/usr/bin/apt-get'
	alias apt-cache-no-proxy '/usr/bin/apt-cache'
	alias ssh-no-proxy '/usr/bin/ssh'
	alias w3m-no-proxy '/usr/bin/w3m'
end

alias st '~/bin/st/st'

alias clipmenu '~/bin/clipmenu/clipmenu -show window -fullscreen'
alias clipboard 'clipmenu'
alias clear-clipboard 'clipboard-clear'

alias download-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) addUri"
# alias download-torrent-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) addTorrent"
alias download-metalink-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) addMetalink"
# alias torrent-download-local "download-torrent-local"
alias aria-list-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) tellActive"
alias aria2-list-local "aria-list-local"
alias download-list-local "aria-list-local"
alias downloads-list-local "aria-list-local"
alias downloads-local "aria-list-local"
alias aria-pause-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) pause"
alias aria2-pause-local "aria-pause-local"
alias download-pause-local "aria-pause-local"
alias aria-stop-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) remove"
alias aria2-stop-local "aria-stop-local"
alias download-stop-local "aria-stop-local"
alias aria-remove-local "aria-stop-local"
alias aria-status-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) tellStatus"
alias aria2-status-local "aria-status-local"
alias download-status-local "aria-status-local"
alias aria-unpause-local "~/bin/aria2rpc/aria2rpc --secret (pass device/aria2) tellUnpause"
alias aria2-unpause-local "aria-unpause-local"
alias download-unpause-local "aria-unpause-local"
alias aria-resume-local "aria-unpause-local"
alias aria2-resume-local "aria-unpause-local"
alias download-resume-local "aria-unpause-local"
alias aria-resume-local "aria-unpause-local"
alias aria2-continue-local "aria-unpause-local"
alias aria2-continue-local "aria-unpause-local"
alias download-continue-local "aria-unpause-local"

alias download "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 addUri"
# alias download-torrent "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 addTorrent"
alias download-metalink "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 addMetalink"
# alias torrent-download "download-torrent"
alias aria-list "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 tellActive"
alias aria2-list "aria-list"
alias download-list "aria-list"
alias downloads-list "aria-list"
alias downloads "aria-list"
alias aria-pause "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 pause"
alias aria2-pause "aria-pause"
alias download-pause "aria-pause"
alias aria-stop "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 remove"
alias aria2-stop "aria-stop"
alias download-stop "aria-stop"
alias aria-remove "aria-stop"
alias aria-status "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 tellStatus"
alias aria2-status "aria-status"
alias download-status "aria-status"
alias aria-unpause "~/bin/aria2rpc/aria2rpc --secret (pass house/server/aria2) --server 192.168.2.125 tellUnpause"
alias aria2-unpause "aria-unpause"
alias download-unpause "aria-unpause"
alias aria-resume "aria-unpause"
alias aria2-resume "aria-unpause"
alias download-resume "aria-unpause"
alias aria-resume "aria-unpause"
alias aria2-continue "aria-unpause"
alias aria2-continue "aria-unpause"
alias download-continue "aria-unpause"

alias upload 'transfer'
alias transfer-sh 'transfer'
alias transfer.sh 'transfer'

alias calc 'octave-cli'
alias calculator 'octave-cli'

alias screencast-asciinema "asciinema rec -w4"
alias asciinema-screencast "screencast-asciinema"
alias record-asciinema "screencast-asciinema"
alias asciinema-record "screencast-asciinema"
alias record "screencast"
alias record-microphone "screencast-microphone"
alias record-with-microphone "screencast-microphone"
alias screencast-with-microphone "screencast-microphone"

alias copy 'xclip -selection clipboard'
alias yank 'xclip -selection clipboard'

#sql wrappers
alias mysql 'mycli'
alias postgres 'pgcli'
alias postgresql 'pgcli'
alias pgsql 'pgcli'
alias psql 'pgcli'

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
alias lsa 'ls -a'
alias lsl 'ls -l --block-size=M'

if test -e /usr/bin/proxychains
	alias emacs 'proxychains emacsclient -c'
	alias emacs-client 'proxychains emacsclient -c'
	alias emacs-daemon 'proxychains /usr/bin/emacs --daemon'
else
	alias emacs 'emacsclient -c'
	alias emacs-client 'emacsclient -c'
	alias emacs-daemon '/usr/bin/emacs --daemon'
end

#pandoc macro
function html-to-pdf
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').pdf
end
function html-to-docx
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').docx
end
function markdown-to-pdf
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').pdf
end
function markdown-to-docx
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').docx
end
alias html-to-doc 'html-to-docx'
alias markdown-to-doc 'markdown-to-docx'
alias md-to-doc 'markdown-to-docx'
alias md-to-docx 'markdown-to-docx'
alias md-to-pdf 'markdown-to-pdf'

#gpg
function gpg-export-key
	gpg2 --export-secret-key $argv --armor > $argv.asc
end

function gpg-encrypt
	gpg2 -e -r $argv
end

function gpg-decrypt
	gpg2 -d $argv
end

#tmux
function tmux-switch
	tmux attach-session -t $argv; or tmux new-session -s $argv
end
alias tmux-goto 'tmux-switch'
alias tmux-new 'tmux-switch'
alias tmux-create 'tmux-switch'
alias tmux-change 'tmux-switch'

alias tmux-rm 'tmux kill-session -t'
alias tmux-kill 'tmux-rm'
alias tmux-remove 'tmux-rm'
alias tmux-delete 'tmux-rm'

alias tmux-config-update "tmux source ~/.tmux.conf"
alias tmux-update-config "tmux-config-update"

alias tmux-rofi '~/bin/rofi-tmux.sh'

alias chromium-debug "chromium-browser --remote-debugging-port=9222 https://localhost:3000"
alias chromium-browser-debug 'chromium-debug'

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
	nmcli dev wifi con $argv[1] password $argv[2]
end

alias wifi-ls "wifi-list"
alias wifi-on "nmcli radio wifi on"
alias wifi-off "nmcli radio wifi off"

alias ip-local "hostname -I"
alias local-ip "ip-local"
alias global-ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias ip-global "dig +short myip.opendns.com @resolver1.opendns.com"
alias ip-web "dig +short myip.opendns.com @resolver1.opendns.com"
alias web-ip "dig +short myip.opendns.com @resolver1.opendns.com"

alias music-import 'import-music'

function weather
	curl wttr.in/"uzhgorod"
end
alias forecast 'weather'

alias screenshot 'scrot'

alias lock 'i3lock -c "0e1112"'
alias desktop-lock 'lock'
alias lock-desktop 'lock'

alias forecast 'weather'

alias nas-mount 'sshfs pi@192.168.2.125:Data/Share ~/Data'

function jetbrains-idea
	~/.local/share/umake/ide/idea-ultimate/bin/idea.sh
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
	bind -e \cs
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
	bind \es sudope

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
