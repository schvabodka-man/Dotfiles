#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
#Homes!
set -x JAVA_HOME '/usr/lib/jvm/java'
set -x GRADLE_HOME '/usr/share/gradle'
set -x EDITOR "emacsclient -c"
set -x BROWSER "flatpak run org.mozilla.FirefoxNightly --no-remote"
set -x FLATPACK_GNOME "3.24"
#aliases
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias rofi-cache-clear 'rm ~/.cache/rofi-3.runcache'
alias newsbeuter-cache-clear 'rm ~/.newsbeuter/cache.db'
alias cd.. 'cd ..' #priceless
alias rm 'rm -rf'
alias lsa 'ls -a'
alias emacs 'emacsclient -nw'

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
	docker run $argv
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

alias firefox 'flatpak run org.mozilla.FirefoxNightly --no-remote'
alias picard 'flatpak run org.musicbrainz.Picard'
alias steam 'flatpak run com.valvesoftware.Steam'
alias libreoffice 'flatpak run org.libreoffice.LibreOffice'
alias skype 'flatpak run com.skype.Client'
alias twitch 'flatpak run com.vinszent.GnomeTwitch'
alias ppsspp 'flatpak run org.ppsspp.PPSSPP'
alias retroarch 'flatpak run org.libretro.RetroArch'

alias books 'calibre'
alias itch.io 'itch'
alias libre-office 'libreoffice'
alias office 'libreoffice'
alias gnome-twitch 'twitch'
alias retro-arch 'retroarch'

#gpg
function export-key
	gpg2 --export-secret-key $argv --armor > $argv.asc
end
alias gpg-export-key 'export-key'

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

#autojump
set --global AUTOJUMP_PATH /usr/share/autojump/autojump.fish
	if test -e $AUTOJUMP_PATH
	source $AUTOJUMP_PATH
end


