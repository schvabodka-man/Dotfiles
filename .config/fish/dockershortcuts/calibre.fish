#!/usr/bin/fish
docker stop calibre
docker rm calibre
docker run --name calibre -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $HOME/Dropbox/Books:/root/Books:z -v $HOME/.config/calibre:/root/config:z -it scvh.com/callibre
