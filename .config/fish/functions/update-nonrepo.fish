function update-nonrepo
    #fish shell
    omf update
	#python/ruby/js stuff
	sudo pip install tldr --upgrade
	sudo gem update meetup-cli
	sudo npm update -g 
	#cmus n shit
	builtin cd ~/.config/.config/cmus/cmus-scripts
	git pull origin master
	sed -i '32s,.*,		setsid feh -g 900x900+1160+546 -x --zoom fill "$ART" &,' cmus-feh.sh
	#cmusfm
	builtin cd ~/bin/cmusfm
	autoreconf --install
	mkdir build
	builtin cd build/
	../configure
	make
	sudo make install
	cd ..
	rm build
	#git helper
	builtin cd ~/bin/pass-git-helper
	git pull origin master
	python3 setup.py install --user
	echo "flatpaks"
	flatpak update com.skype.Client
	flatpak update com.vinszent.GnomeTwitch
	flatpak update org.gnome.FeedReader
	flatpak update org.libreoffice.LibreOffice
	flatpak update org.musicbrainz.
	flatpak update io.github.GnomeMpv
end
