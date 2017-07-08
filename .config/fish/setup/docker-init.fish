#!/usr/bin/fish
docker run --name tldr -t scvh.com/tldr
docker run --name weather-npm -t scvh.com/weather-npm
docker run --name meetup-cli -v $HOME/.config/meetup-cli:/root/ -t scvh.com/meetup-cli
docker run --name newsbeuter -v $HOME/.newsbeuter:/root/.newsbeuter/:z -it scvh.com/newsbeuter 
docker run --name rtorrent -v ~/Downloads:/root/Downloads:z -v ~/Torrents:/root/Torrents:z -v ~/.config/rtorrent:/root/:z -e -it scvh.com/rtorrent 

