#disable greeting
set fish_greeting ""
#Powerline theming
set -g theme_display_date yes
set -g theme_color_scheme dark
set -g theme_display_hg yes
#Homes!
set -x JAVA_HOME '/usr/share/java'
set -x GRADLE_HOME '/usr/share/gradle'
set -x GROOVY_HOME '/usr/share/groovy'
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

#shell bookmarks
. ~/.fishmarks/marks.fish

source ~/.local/share/icons-in-terminal/icons.fish
source ~/bin/up/up.fish
source ~/bin/pip-fish/pip.fish
source ~/bin/docker-fish/docker.fish
source ~/bin/docker-fish/docker-compose.fish
source ~/bin/hub-fish/hub.fish

function fish_user_key_bindings
	bind \es sudope
	bind \e\t complete
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

alias sloc 'cloc'
alias gopm '~/Go/bin/gopm'
alias transfersh 'transfer-sh'
alias upload 'transfer-sh'
alias j "z"

#better work with standart unix utils
alias tree 'alder'
alias cp 'pycp'
alias mv 'pymv'
alias cat 'bcat'
alias cd.. 'up' #priceless
alias .. 'up'
alias ls '~/bin/ls-icons/binary/bin/ls --color'
alias dir '~/bin/ls-icons/binary/bin/dir --color'
alias diff 'colordiff'
function less
	/usr/bin/src-hilite-lesspipe.sh $argv | /bin/less -R -N
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
alias mysql 'mycli'
alias postgres 'pgcli'
alias postgresql 'pgcli'
alias pgsql 'pgcli'
alias psql 'pgcli'

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
alias rofi-cache-clear 'rm ~/.cache/rofi-3.runcache'
alias newsbeuter-cache-clear 'rm ~/.newsbeuter/cache.db'
alias move 'mv'
alias copy 'cp'
alias rm 'rm -rf'
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
