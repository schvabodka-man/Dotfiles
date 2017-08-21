#!/usr/bin/fish
if tmux ls | grep cmus
	tmux attach-session -t cmus
else
	tmux new-session -A -D -s cmus cmus
end
