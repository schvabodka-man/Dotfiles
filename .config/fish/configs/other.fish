alias upload 'transfer'
alias transfer-sh 'transfer'
alias transfer.sh 'transfer'

function calc
	if count $argv > /dev/null
		octave-cli --eval "$argv"
	else
		octave-cli
	end
end
alias calculator 'calc'
alias calculate 'calc'

alias screencast-asciinema "asciinema rec -w4"
alias asciinema-screencast "screencast-asciinema"
alias record-asciinema "screencast-asciinema"
alias asciinema-record "screencast-asciinema"
alias record "screencast"
alias record-microphone "screencast-microphone"
alias record-with-microphone "screencast-microphone"
alias screencast-with-microphone "screencast-microphone"

#sql wrappers
alias mysql 'mycli'
alias postgres 'pgcli'
alias postgresql 'pgcli'
alias pgsql 'pgcli'
alias psql 'pgcli'

alias fzf "~/bin/fzf/bin/fzf"
alias search 'fzf'

function xd
	cd (/usr/bin/xd $argv)
end
