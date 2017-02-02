#!/usr/bin/fish
echo "basic tools"
sudo dnf install git
sudo dnf install util-linux-user
mkdir /home/user/bin/
sudo dnf install shntool
sudo dnf install cuetools
sudo dnf copr enable unrealps/misc
sudo dnf install nitrogen
sudo dnf copr enable yaroslav/i3desktop
sudo dnf install i3-gaps
sudo dnf install rofi
sudo dnf install p7zip
sudo dnf install xdotool
sudo dnf install docker
sudo dnf install unrar
echo "oh-my-fish"
curl -L http://get.oh-my.fish | fish # oh-my-fish
sudo dnf install powerline-fonts
omf install bobthefish
echo "Emacs"
sudo dnf install emacs
echo "Tldr"
sudo pip install tldr
echo "meetups and asciinema with videos"
sudo gem install meetup-cli
sudo dnf install asciinema
sudo dnf install mpv
echo "elscreen"
git clone https://github.com/rocher/elscreen-fr.git ~/.emacs.d/elscreen-fr
echo "yadm"
sudo dnf copr enable thelocehiliosan/yadm
sudo dnf install yadm
# IMHO best cli app for weather
sudo npm install forecast-cli -g
echo "autojump"
sudo dnf install autojump-fish
