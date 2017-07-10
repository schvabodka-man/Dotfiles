#!/usr/bin/fish
if docker ps | grep rtorrent
	docker attach rtorrent
else
	docker stop rtorrent > /dev/null
	docker rm rtorrent > /dev/null
	docker run --name rtorrent -v $HOME/Downloads:/root/Downloads -v $HOME/Torrents:/root/Torrents -v ~/.config/rtorrent:/root/ -v $HOME/.rtorrent.session/:/root/.rtorrent.session -it scvh.com/rtorrent 
end
