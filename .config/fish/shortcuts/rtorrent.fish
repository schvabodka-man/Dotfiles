#!/usr/bin/fish
if tmux ls | grep rtorrent
	tmux attach-session -t rtorrent
else
	tmux new-session rtorrent rtorrent
end
