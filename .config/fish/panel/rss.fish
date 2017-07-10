#!/usr/bin/fish
docker stop newsnotification > /dev/null
docker rm newsnotification > /dev/null
set unread (docker run --name newsnotification -v $HOME/.newsnotify:/root/.newsbeuter/ -it scvh.com/notify newsbeuter -x print-unread)
set parseit (echo $unread | perl -n -e '/(\d+) unread articles/ && print "$1\n"') #that's dirty hack but it works at all
echo  $parseit
