#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
#Homes!
set -x JAVA_HOME '/usr/lib/jvm/java'
set -x GRADLE_HOME '/usr/share/gradle'
set -x EDITOR "emacsclient -c"
set -x BROWSER "firefox"

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

function tldr
	docker stop tldr > /dev/null
	docker rm tldr > /dev/null
	docker run --name tldr -t scvh.com/tldr $argv
end

function forecast
	docker stop weather-npm > /dev/null
	docker rm weather-npm > /dev/null
	if count $argv > /dev/null
		docker run --name weather-npm -t scvh.com/weather-npm $argv
	else
		docker run --name weather-npm -t scvh.com/weather-npm "Uzhgorod"
	end
end
alias weather 'forecast'

function meetup
	docker stop meetup-cli > /dev/null
	docker rm meetup-cli > /dev/null
	docker run --name meetup-cli -v $HOME/.config/meetup-cli:/root/ -t scvh.com/meetup-cli
end
alias meetups 'meetup'

alias calibre "~/.config/fish/dockershortcuts/calibre.fish"
alias cmus '~/.config/fish/dockershortcuts/cmus.fish' 
alias rtorrent '~/.config/fish/dockershortcuts/rtorrent.fish' 
alias newsbeuter '~/.config/fish/dockershortcuts/news.fish'
alias mutt '~/.config/fish/dockershortcuts/mutt.fish'
alias profanity '~/.config/fish/dockershortcuts/profanity.fish'
alias itch '~/.config/fish/dockershortcuts/itch.fish'

alias firefox 'flatpak run org.mozilla.FirefoxNightly --no-remote'
alias picard 'flatpak run org.musicbrainz.Picard'
alias steam 'flatpak run com.valvesoftware.Steam'
alias libreoffice 'flatpak run org.libreoffice.LibreOffice'
alias skype 'flatpak run com.skype.Client'
alias twitch 'flatpak run com.vinszent.GnomeTwitch'

alias news 'newsbeuter'
alias torrent 'rtorrent'
alias mail 'mail'
alias music 'cmus'
alias books 'calibre'
alias xmpp 'profanity'
alias itch.io 'itch'
alias libre-office 'libreoffice'
alias office 'libreoffice'
alias gnome-twitch 'twitch'

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


