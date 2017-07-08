#!/usr/bin/fish
#there is nothing better than plain old script
docker stop weather-npm > /dev/null
docker rm weather-npm > /dev/null
docker run --name weather-npm -t scvh.com/weather-npm
docker stop meetup-cli > /dev/null
docker rm meetup-cli > /dev/null
docker run --name meetup-cli -v $HOME/.config/meetup-cli:/root/ -t scvh.com/meetup-cli
docker stop tldr > /dev/null
docker rm tldr > /dev/null
docker run --name tldr -t scvh.com/tldr
