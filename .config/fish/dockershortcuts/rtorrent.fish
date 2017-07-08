#!/usr/bin/fish
if docker ps | grep rtorrent
	docker attach rtorrent
else
	docker stop rtorrent > /dev/null
	docker rm rtorrent > /dev/null
	docker run --name rtorrent -v ~/Downloads:/root/Downloads:z -v ~/Torrents:/root/Torrents:z -v ~/.config/rtorrent:/root/:z -e -it scvh.com/rtorrent 
end
