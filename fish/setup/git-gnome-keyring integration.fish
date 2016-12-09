#!/usr/bin/fish
builtin cd /usr/share/git/credential/gnome-keyring/
sudo make
git config --global credential.helper /usr/share/git/credential/gnome-keyring/git-credential-gnome-keyring
