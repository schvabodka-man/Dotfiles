#!/usr/bin/fish
echo "basic tools"
sudo dnf install git
sudo dnf install fish
sudo dnf install util-linux-user
sudo chsh -s /usr/bin/fish
chsh -s /usr/bin/fish
sudo dnf install picard
mkdir /home/user/bin/
sudo dnf install picard
sudo dnf install shntool
sudo dnf install cuetools
sudo dnf copr enable unrealps/misc
sudo dnf install nitrogen
sudo dnf copr enable yaroslav/i3desktop
sudo dnf install i3-gaps
sudo dnf install rofi
sudo dnf remove pragha
sudo dnf install p7zip
sudo dnf install xdotool
sudo dnf install docker
echo "oh-my-fish"
curl -L http://get.oh-my.fish | fish # oh-my-fish
sudo dnf install powerline-fonts
omf install bobthefish
echo "unix pass"
sudo dnf install pass
echo "Emacs"
sudo dnf install emacs
echo "fonts"
sudo dnf install mozilla-fira-mono-fonts
echo "Development stuff"
sudo dnf install redhat-rpm-config
sudo dnf install python-devel
sudo dnf install openssl-devel
echo "Font awesome"
sudo dnf install fontawesome-fonts
sudo dnf install fontawesome-fonts-web
echo "Tldr"
sudo pip install tldr
sudo dnf install ruby-devel
sudo dnf install gcc-c++
sudo dnf groupinstall 'Development tools'
echo "meetups and asciinema with videos"
sudo gem install meetup-cli
sudo dnf install asciinema
sudo dnf install mpv
echo "elscreen"
git clone https://github.com/rocher/elscreen-fr.git ~/.emacs.d/elscreen-fr
echo "setting up git pass helper"
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
echo "rar"
sudo dnf install unrar
echo "atom.io"
sudo dnf copr enable mosquito/atom
sudo dnf install atom
echo "yadm"
sudo dnf copr enable thelocehiliosan/yadm
sudo dnf install yadm
echo "todo.txt"
sudo dnf install php
sudo dnf install php-mbstring
builtin cd ~/bin
git clone https://github.com/onovy/otodo.git
mkdir /home/user/.config/todo.txt/
# IMHO best cli app for weather
sudo npm install forecast-cli -g
echo "xorg apps"
sudo dnf install xorg-x11-apps
