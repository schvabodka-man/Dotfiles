#disable greeting
set fish_greeting ""
#variables for file manager
set -g -x fish ~/.config/fish
set -g -x screenshots ~/Pictures/Screenshots/
set -g -x vscode ~/.config/VSCode/User/
set -g -x steam ~/.steam/steam/
#Powerline theming
set -g theme_display_date no
set -g theme_color_scheme dark
#aliases
alias update "sudo dnf upgrade"
alias xrdb-merge 'xrdb -merge ~/.Xresources'
alias rofi-cache-clear 'rm ~/.cache/rofi-3.runcache'
alias cd.. 'cd ..' #priceless
alias rm 'rm -rf'
alias lsa 'ls -a'

#more aliases

# Custom alias for listing files when moving to directory
function cd
  builtin cd $argv
  ls -a
end

# package manager aliases
#enable copr repo
function search-copr -d "search in copr repos"
    dnf copr search $argv
end

function search-repo -d "search in repository"
    dnf search $argv
end

#simple chmod alias
function make-exec
  chmod +x $argv
end

#weather forecast
function weather
  curl wttr.in/"uzhgorod"
end

function forecast
  curl wttr.in/"uzhgorod"
end

#gpg
function export-key
  gpg2 --export-secret-key $argv --armor > $argv.asc
end

