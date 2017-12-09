#!/bin/bash
# forked from here https://github.com/mi2428/dotfiles/blob/master/etc/hosts/linux/rofi/rofi/rofi-tmux.sh
# fixed to work for st terminal
# removed some stuff releated to ssh(but there is still lot of code for it but IDK)
# thx mi2428 for original script

set -e
cd $HOME

declare -r TERMINAL="termite -e "

_rofi() {
    rofi -dmenu -fullscreen "$@"
}

rofi_menu() {
    local mesg="$1" entries="$2" prompt="$3"
    printf "$(printf "$entries" | _rofi -mesg "$mesg" -p "$prompt")"
}


server-list() {
    while read host; do
        [[ "$host" = "github.com" ]] && continue
        [[ "$host" = "gitlab.i.mi2428.net" ]] && continue
        host="@$host"
        printf "[=] $host\n"
    done < <(grep -e '^Host' $HOME/.ssh/config | awk '{print $NF}')
}

session-list() {
    local host=$1 sessions="tmux list-sessions"
    [[ -n "$host" ]] && sessions="ssh $host $sessions"
    while read session; do
        printf "[#] $session\n"
    done < <($sessions | sort -n)
}

create() {
	$TERMINAL "tmux" "new-session"
}

attach() {
    local session=$1
	$TERMINAL "tmux" "attach-session" "-t" "$session"
}

main() {
    local host="$1" menu option session attach create
    menu="[+] Create new session\n"
    menu+="$(session-list $host)\n"
    [[ -z "$host" ]] && menu+="$(server-list)"
    option=$(rofi_menu "select tmux session" "$menu" "tmux: ")
    [[ -z "$option" ]] && exit 1

    [[ -z "$host" ]] && \
		host="$(printf "$option" | grep -e '^\[=\] @\(.*\)$' | sed -e 's/^\[=\] @\(.*\)$/\1/g')"
    session="$(printf "$option" | grep -e '^\[#\] \(.*\):.*$' | sed -e 's/^\[#\] \(.*\): [1-9] windows.*$/\1/g')"
    [[ -n "$session" ]] && attach=true || attach=false
    [[ -n "$(printf "$option" | grep -e '\[+\]')" ]] && create=true || create=false

    $create && create && exit 0
    $attach && attach "$session" && exit 0
    main "$host"
} && main
