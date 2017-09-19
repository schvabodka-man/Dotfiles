#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
#Homes!
set -x JAVA_HOME '/usr/lib/jvm/java'
set -x GRADLE_HOME '/usr/share/gradle'
set -x GOPATH '/home/user/Go'
set -x EDITOR "emacsclient -c"
set -x BROWSER "luakit"
set -x FLATPACK_GNOME "3.24"

set -x TLDR_COLOR_BLANK "white"
set -x TLDR_COLOR_NAME "cyan"
set -x TLDR_COLOR_DESCRIPTION "white"
set -x TLDR_COLOR_EXAMPLE "green"
set -x TLDR_COLOR_COMMAND "red"
set -x TLDR_COLOR_PARAMETER "white"
set -x TLDR_CACHE_ENABLED "1"
set -x TLDR_CACHE_MAX_AGE "720"

# Custom alias for listing files when moving to directory
function cd
	builtin cd $argv
	ls -a
end

#docker shitty aliases
function docker-build
	docker build -t scvh.com/$argv $argv
end
function docker-kill
	docker stop $argv > /dev/null
	docker rm $argv > /dev/null
end
function docker-run
	#fish shell don't allow me to set variables with dashes in it
	docker stop (echo $argv | perl -n -e '/^--name\s(.|\w+)\s-|--/ && print "$1\n"') > /dev/null
	docker rm (echo $argv | perl -n -e '/^--name\s(.|\w+)\s-|--/ && print "$1\n"') > /dev/null
	t	docker run $argv
end

function forecast
	if count $argv > /dev/null
		/usr/bin/forecast --hourly $argv
	else
		/usr/bin/forecast --hourly "Uzhgorod"
	end
end
alias weather 'forecast'

alias itch '~/.config/fish/dockershortcuts/itch.fish'

alias picard 'flatpak run org.musicbrainz.Picard'
alias steam 'flatpak run com.valvesoftware.Steam'
alias libreoffice 'flatpak run org.libreoffice.LibreOffice'
alias skype 'flatpak run com.skype.Client'
alias ppsspp 'flatpak run org.ppsspp.PPSSPP'
alias retroarch 'flatpak run org.libretro.RetroArch'

alias email 'emacsclient -c --eval "(gnus)"'
alias mail 'emacsclient -c --eval "(gnus)"'
alias books 'calibre'
alias itch.io 'itch'
alias libre-office 'libreoffice'
alias office 'libreoffice'
alias retro-arch 'retroarch'

alias sloc 'cloc'
alias mysql 'mycli'
alias postgres 'pgcli'
alias postgresql 'pgcli'
alias pgsql 'pgcli'
alias psql 'pgcli'
alias translate 'trino'
alias google '~/bin/googler/googler'
alias gopm '/home/user/Go/bin/gopm'
alias license '/home/user/Go/bin/license'
alias fpp '/home/user/bin/PathPicker/fpp'

alias project 'touch .projectile'
function project-js
	touch .indium
	touch .projectile
	touch .tern-project
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

function search #for some reason i cant just pipe my shit
	fzf --ansi --inline-info --multi --history=/home/user/.config/fzf/history --preview="cat {}" > .found
	cat .found | fpp
	rm .found
end

alias passwords 'search-password'

alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias rofi-cache-clear 'rm ~/.cache/rofi-3.runcache'
alias newsbeuter-cache-clear 'rm ~/.newsbeuter/cache.db'
alias move 'mv'
alias copy 'cp'
alias cd.. 'cd ..' #priceless
alias rm 'rm -rf'
alias lsa 'ls -a'
alias emacs 'emacsclient -nw'
alias emacs-daemon '/usr/bin/emacs --daemon'
alias cat '/home/user/Go/bin/ccat'
alias tree 'alder'

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
alias tmux-server "tmux start-server"
alias tmux-ls "tmux ls"
alias tmux-list "tmux ls"
alias tmux-sessions "tmux ls"
alias tmux-connect "tmux-attach"
alias tmux-config-update "tmux source ~/.config/tmux/tmux.conf"
alias tmux-update-config "tmux source ~/.config/tmux/tmux.conf"

alias cmus "~/.config/fish/shortcuts/cmus.fish"
alias rtorrent "~/.config/fish/shortcuts/rtorrent.fish"

alias chromium-debug "chromium-browser --disable-gpu --remote-debugging-port=9222 https://localhost:3000"

alias git-gui "tig"
alias git-history "tig"

. ~/.fishmarks/marks.fish
alias j "z"
