#!/usr/bin/fish
if cat /proc/version | grep fedora
	sudo dnf install pass
	sudo dnf install git
	sudo dnf install feh
	sudo dnf install shntool
	sudo dnf install cuetools
	sudo dnf install p7zip
	sudo dnf install docker
	sudo dnf install unrar
	sudo dnf install powerline-fonts
	sudo dnf install thefuck
	sudo dnf install autojump-fish

	sudo dnf isntall python3
	sudo dnf isntall python
	sudo dnf isntall rubygems
	sudo dnf install flatpak
	sudo dnf install transmission

	sudo dnf install firefox
	sudo dnf install emacs
	sudo dnf install calibre
	sudo dnf install geary

	sudo dnf install beets
	sudo dnf install beets-plugins

	sudo dnf install python-devel
	sudo dnf install openssl-devel
	sudo dnf install ruby-devel
	sudo dnf install gcc-c++
	sudo dnf install libcurl-devel
	sudo dnf install autoconf automake
	sudo dnf install cmake

	sudo dnf install texlive-scheme-full
end

#fish shell 
curl -L http://get.oh-my.fish | fish # oh-my-fish
omf install bobthefish
omf install sudope
omf install thefuck

builtin cd ~/bin/
git clone https://github.com/languitar/pass-git-helper.git
cd ~/bin/pass-git-helper
python3 setup.py install --user
builtin cd ~/.config/
mkdir pass-git-helper
cd pass-git-helper/
git config --global credential.helper /home/user/bin/pass-git-helper/pass-git-helper
echo "[github.com*]
target=development/github/keys/schvabodka-man
skip_username=0" > git-pass-mapping.ini

sudo pip install tldr
sudo gem install meetup-cli
sudo npm install forecast-cli -g

#cmus
builtin cd ~/bin/
git clone https://github.com/Arkq/cmusfm
builtin cd cmusfm/
autoreconf --install
mkdir build
builtin cd build/
../configure
make
sudo make install
cmusfm init
cd ..
rm build
#cmus feh art
builtin cd ~/.config/cmus
git clone https://github.com/TiredSounds/cmus-scripts
builtin cd cmus-scripts/
sed -i '32s,.*,		setsid feh -g 900x900+1160+546 -x --zoom fill "$ART" &,' cmus-feh.sh

#flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flatflatpak --user remote-add gnome-nightly gnome-nightly.flatpakrepohub.flatpakrepo
flatpak install flathub org.musicbrainz.Picard
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub org.gnome.FeedReader 
#libreoffice
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
flatpak install gnome org.gnome.Platform $FLATPACK_GNOME
flatpak install gnome org.gnome.Platform.Locale $FLATPACK_GNOME
flatpak install gnome org.gnome.Sdk $FLATPACK_GNOME
wget http://download.documentfoundation.org/libreoffice/flatpak/LibreOffice.flatpakref
flatpak install --from LibreOffice.flatpakref
rm gnome-sdk.gpg
rm LibreOffice.flatpakref
#twitch
flatpak install --from https://dl.tingping.se/flatpak/gnome-twitch.flatpakref
#skype
flatpak install --from https://s3.amazonaws.com/alexlarsson/skype-repo/skype.flatpakref
#emulators for meme games
flatpak install flathub org.ppsspp.PPSSPP
flatpak install flathub org.libretro.RetroArch
