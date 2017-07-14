#!/usr/bin/fish

sudo dnf install pass
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

sudo dnf install transmission

sudo dnf install firefox
sudo dnf install emacs
sudo dnf install calibre

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
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
