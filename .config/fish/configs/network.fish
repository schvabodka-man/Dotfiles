function wifi-list
	nmcli dev wifi rescan > /dev/null
	nmcli dev wifi list
end

function wifi-connect
	nmcli dev wifi rescan > /dev/null
	nmcli dev wifi con $argv[1] password $argv[2]
	nmcli connection mod $argv[1] ipv4.dns "51.254.25.115 185.121.170.176 188.165.200.156 52.174.55.168"
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
