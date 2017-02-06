#!/usr/bin/fish
echo "basic tools"
sudo dnf install git
sudo dnf install util-linux-user
mkdir /home/user/bin/
sudo dnf install shntool
sudo dnf install cuetools
sudo dnf install p7zip
sudo dnf install xdotool
sudo dnf install docker
sudo dnf install unrar
echo "oh-my-fish"
curl -L http://get.oh-my.fish | fish # oh-my-fish
sudo dnf install powerline-fonts
omf install bobthefish
echo "Tldr"
sudo pip install tldr
echo "yadm"
sudo dnf copr enable thelocehiliosan/yadm
sudo dnf install yadm
echo "autojump"
sudo dnf install autojump-fish
