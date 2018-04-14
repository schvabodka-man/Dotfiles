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
