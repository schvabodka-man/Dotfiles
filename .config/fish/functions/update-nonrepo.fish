function update-nonrepo
    echo "Updating oh-my-fish"
    omf update
	sudo pip install tldr --upgrade
	sudo gem update meetup-cli
	sudo npm update -g 
	echo "Cmus album art"
	builtin cd ~/.config/.config/cmus/cmus-scripts
	git pull origin master
	sed -i '32s,.*,		setsid feh -g 900x900+1160+546 -x --zoom fill "$ART" &,' cmus-feh.sh
	echo "flatpaks"
	flatpak update com.skype.Client
	flatpak update com.vinszent.GnomeTwitch
	flatpak update org.gnome.FeedReader
	flatpak update org.libreoffice.LibreOffice
	flatpak update org.musicbrainz.Picard
end
