#!/usr/bin/fish
if tmux ls | grep mutt
	tmux attach-session -s cmus
else
	tmux new -s cmus -d /usr/bin/cmus
	tmux attach-session -t cmus 
end
