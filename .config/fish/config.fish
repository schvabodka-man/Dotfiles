#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
#Homes!
set -x JAVA_HOME '/usr/lib/jvm/java'
set -x GRADLE_HOME '/usr/share/gradle'
set -x GOPATH '/home/user/Go'
set -x LGOBIN '/home/user/Go/bin'
set -x ANDROID_HOME '/home/user/Android/Sdk'
set -x EDITOR "emacsclient -c"
set -x BROWSER "luakit"
set -x FLATPACK_GNOME "3.24"

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
alias icat '~/bin/icat/icat'
alias mysql 'mycli'
alias postgres 'pgcli'
alias postgresql 'pgcli'
alias pgsql 'pgcli'
alias psql 'pgcli'
alias gopm '~/Go/bin/gopm'
alias tree 'alder'

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

function cat
	for arg in $argv
		if echo $arg | grep jpg > /dev/null
			~/bin/icat/icat $arg
			break
		else if echo $arg | grep jpeg > /dev/null
			~/bin/icat/icat $argv
			break
		else if echo $arg | grep png > /dev/null
			~/bin/icat/icat $argv
			break
		else
			~/Go/bin/ccat $argv
			break
		end
	end
end

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

. ~/.fishmarks/marks.fish

alias j "z"
