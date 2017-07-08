#!/usr/bin/fish
if docker ps | grep mutt
	docker attach mutt
else
	docker stop mutt > /dev/null
	docker rm mutt > /dev/null
	docker run --name mutt -v $HOME/.config/mutt:/root/:z -it scvh.com/mutt 
end
