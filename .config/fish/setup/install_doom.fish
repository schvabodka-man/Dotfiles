#!/usr/bin/fish
sudo dnf copr enable fszymanski/gzdoom
sudo dnf install gzdoom
cd ~/bin/
mkdir SSGL
wget https://github.com/FreaKzero/ssgl-doom-launcher/releases/download/v1.1.1/linux64.tar.gz
tar xC SSGL/ -f linux64.tar.gz
cd SSGL/
chmod +x SSGL
cd ~/bin
rm linux64.tar.gz
