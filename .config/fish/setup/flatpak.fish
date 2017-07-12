#!/usr/bin/fish
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.musicbrainz.Picard
flatpak install flathub com.valvesoftware.Steam
#libreoffice
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
flatpak install gnome org.gnome.Platform 3.24
flatpak install gnome org.gnome.Platform.Locale 3.24
wget http://download.documentfoundation.org/libreoffice/flatpak/LibreOffice.flatpakref
flatpak install --from LibreOffice.flatpakref
rm gnome-sdk.gpg
rm LibreOffice.flatpakref
#twitch
flatpak install --from https://dl.tingping.se/flatpak/gnome-twitch.flatpakref
#firefox
wget https://firefox-flatpak.mojefedora.cz/org.mozilla.FirefoxNightly.flatpak
flatpak install org.mozilla.FirefoxNightly.flatpak
rm org.mozilla.FirefoxNightly.flatpak
