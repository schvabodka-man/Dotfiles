#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
set -g theme_display_hg yes
set -g theme_display_cmd_duration yes
set -g theme_show_exit_status yes
set -x TLDR_COLOR_BLANK "white"
set -x TLDR_COLOR_BLANK "white"
set -x TLDR_COLOR_NAME "cyan"
set -x TLDR_COLOR_DESCRIPTION "white"
set -x TLDR_COLOR_EXAMPLE "green"
set -x TLDR_COLOR_COMMAND "red"
set -x TLDR_COLOR_PARAMETER "white"
set -x TLDR_CACHE_ENABLED "1"
set -x TLDR_CACHE_MAX_AGE "720"
set -x user (whoami)
set -x GOPATH "/home/$user/Go"
set -x LGOBIN "/home/user/Go/bin"
set -x EDITOR "emacsclient -c"
set -x BROWSER "qutebrowser"
#clipboard manager
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
set -x FZF_DEFAULT_OPTS "--preview '/usr/share/source-highlight/src-hilite-lesspipe.sh {}' \
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

if test -e ~/bin/up/up.fish
	source ~/bin/up/up.fish
	alias cd.. 'up' #priceless
	alias .. 'up'
end

source ~/.config/fish/startup.fish
source ~/.config/fish/configs/basic-utils.fish
# source ~/.config/fish/configs/proxy.fish
source ~/.config/fish/configs/clipboard.fish

alias st '~/bin/st/st'

source ~/.config/fish/configs/other.fish

source ~/.config/fish/configs/projects.fish

source ~/.config/fish/configs/pandoc.fish

source ~/.config/fish/configs/gpg.fish

source ~/.config/fish/configs/tmux.fish

alias chromium-debug "chromium-browser --remote-debugging-port=9222 https://localhost:3000"
alias chromium-browser-debug 'chromium-debug'

source ~/.config/fish/configs/git.fish

function zip
	for arg in argv
		/bin/zip -r $arg.zip $arg
	end
end

source ~/.config/fish/configs/network.fish

alias music-import 'import-music'

function weather
	curl wttr.in/$argv
end
alias forecast 'weather'

alias screenshot 'scrot'

alias lock 'i3lock -c "0e1112"'
alias desktop-lock 'lock'
alias lock-desktop 'lock'

alias jetbrains-toolbox "~/bin/jetbrains-toolbox"

source ~/.config/fish/configs/screen.fish

source ~/.config/fish/configs/emulation.fish

function magnet2torrent
	python ~/bin/mag2tor/mag2tor.py $argv
end
alias mag2tor 'magnet2torrent'

source ~/.config/fish/configs/wii.fish

alias latex-compile 'pdflatex'
function rmarkdown-compile
	Rscript -e "library(rmarkdown);render('$argv')"
end

alias sent '~/bin/sent/sent'
alias presentation 'sent'

source ~/.config/fish/configs/sandbox.fish

alias kiwix '~/bin/kiwix/kiwix'

alias emacs 'emacsclient -c'

source ~/.config/fish/configs/cloud.fish

set -U fish_key_bindings fish_default_key_bindings

function dd-write
	if test -e $argv[2]
		sudo umount $argv[2]
		sudo dd bs=4M if=$argv[1] of=$argv[2] status=progress oflag=sync conv=fdatasync
	else
		echo "such block device not found"
	end
end

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
