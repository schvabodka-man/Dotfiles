#tmux startup
function start-tmux-session
	tmux attach-session -t main; or tmux new-session -s main
end
#tmux
function tmux-switch
	tmux attach-session -t $argv; or tmux new-session -s $argv
end
alias tmux-goto 'tmux-switch'
alias tmux-new 'tmux-switch'
alias tmux-create 'tmux-switch'
alias tmux-change 'tmux-switch'

alias tmux-rm 'tmux kill-session -t'
alias tmux-kill 'tmux-rm'
alias tmux-remove 'tmux-rm'
alias tmux-delete 'tmux-rm'

alias tmux-config-update "tmux source ~/.tmux.conf"
alias tmux-update-config "tmux-config-update"

alias tmux-rofi '~/bin/rofi-tmux.sh'
