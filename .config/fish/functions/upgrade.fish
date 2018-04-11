function upgrade
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo pip install -U (pip freeze | awk '{split($0, a, "=="); print a[1]}')
	sudo pip3 install -U (pip3 freeze | awk '{split($0, a, "=="); print a[1]}')
	sudo gem update
	sudo npm update -g
	sudo cabal update
	sudo cabal upgrade
	sudo cpan -u
	omf update
	~/Go/bin/gopm update
    docker images | grep -v REPOSITORY | awk '{print $1}' | xargs -L1 docker pull
    docker images | grep "<none>" | awk '{print $3}' | xargs -L1 docker rmi
    emacsclient --eval '(kill-emacs)'
	/bin/rm -rf ~/.emacs.d/elpa
	/bin/rm -rf ~/.emacs.d/el-get
    /usr/bin/emacs --daemon
    
	cd ~/bin/clipmenu
	git pull origin master

	cd ~/bin/fzf
	git pull origin master

	cd ~/bin/icat
	git pull origin master
	rm icat
	make

	cd ~/bin/pass-git-helper
	git pull origin master

	cd ~/bin/rofi-pass
	git pull origin master
end
