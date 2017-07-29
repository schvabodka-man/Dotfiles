function update-nonrepo
    #fish shell
    omf update
	#python/ruby/js/lua stuff
	sudo pip install tldr --upgrade
	sudo pip install mycli --upgrade
	sudo pip install pgcli --upgrade
	sudo gem update meetup-cli
	sudo npm update -g
	sudo luarocks install --server=http://luarocks.org/dev luash
	/home/user/Go/bin/gopm update
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
	#fzf
	builtin cd ~/bin/fzf
	git pull origin master
	./install
	#path picket
	builtin cd ~/bin/PathPicker
	git pull origin master
	#git helper
	builtin cd ~/bin/pass-git-helper
	git pull origin master
	python3 setup.py install --user
	#flatpaks
	flatpak update com.skype.Client
	flatpak update com.vinszent.GnomeTwitch
	flatpak update org.gnome.FeedReader
	flatpak update org.libreoffice.LibreOffice
	flatpak update org.musicbrainz.Picard
	flatpak update io.github.GnomeMpv
    flatpak update org.ppsspp.PPSSPP
	flatpak update org.libretro.RetroArch
	flatpak update org.gnome.Geary
	flatpak update org.gnucash.GnuCash
end
