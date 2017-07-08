#!/usr/bin/fish
if docker ps | grep newsbeuter
	docker attach newsbeuter
else
	docker stop newsbeuter > /dev/null
	docker rm newsbeuter > /dev/null
	docker run --name newsbeuter -v $HOME/.newsbeuter:/root/.newsbeuter/:z -it scvh.com/newsbeuter 
end
