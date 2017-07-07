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
	docker stop $argv
	docker rm $argv
end

function tldr
	docker exec -i -t tldr tldr $argv
end

function forecast
	if count $argv > /dev/null
		docker exec -i -t weather-npm forecast "$argv"
	else
		docker exec -i -t weather-npm forecast "Uzhgorod"
	end
end
alias weather 'forecast'

function meetup
	docker exec -t meetup-cli meetup-cli --color
end
alias meetups 'meetup'

#gpg
function export-key
	gpg2 --export-secret-key $argv --armor > $argv.asc
end
	
#autojump
set --global AUTOJUMP_PATH /usr/share/autojump/autojump.fish
	if test -e $AUTOJUMP_PATH
	source $AUTOJUMP_PATH
end


