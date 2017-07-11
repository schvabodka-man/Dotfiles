#!/usr/bin/fish
docker stop itch > /dev/null
docker rm itch > /dev/null
docker run --name itch -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v $HOME/.config/itch/itch:/root/.config/itch -v $HOME/.config/itch/pki:/root/.pki -it scvh.com/itch
