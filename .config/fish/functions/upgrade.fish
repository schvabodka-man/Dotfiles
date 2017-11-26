function upgrade
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo pip install -U (pip freeze | awk '{split($0, a, "=="); print a[1]}')
	sudo gem update
	sudo npm update -g
	sudo cabal update
	sudo cabal upgrade
	omf update
	~/Go/bin/gopm update

	cd ~/bin/clipmenu
	git pull origin master

	cd ~/bin/fzf
	git pull origin master

	cd ~/bin/icat
	git pull origin master
	rm icat
	make

	cd ~/bin/offlineimap-daemon
	git pull origin master

	cd ~/bin/pass-git-helper
	git pull origin master

	cd ~/bin/rofi-pass
	git pull origin master

	cd ~/bin/st
	git pull origin master
	rm st
	rm config.h
	cp ~/.config/st/config.h ./config.h
	make
end
