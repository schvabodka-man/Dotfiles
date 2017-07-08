#!/usr/bin/fish
docker run --name tldr --restart always -t scvh.com/tldr
docker run --name weather-npm --restart always -t scvh.com/weather-npm
docker run --name meetup-cli --restart always -v $HOME/.config/meetup-cli:/root/ -t scvh.com/meetup-cli
#docker run --name newsbeuter --restart always -v $HOME/.newsbeuter:/root/.newsbeuter/:z -itd scvh.com/newsbeuter /bin/bash
#docker run --name rtorrent -v ~/Downloads:/root/Downloads:z -v ~/Torrents:/root/Torrents:z -v ~/.config/rtorrent:/root/:z -e -itd scvh.com/rtorrent 

