#!/usr/bin/fish
sudo dnf copr enable unrealps/misc
sudo dnf install nitrogen
sudo dnf copr enable yaroslav/i3desktop
sudo dnf install i3-gaps
sudo dnf install rofi
sudo dnf copr enable kzmd/polybar
sudo dnf install polybar
sudo dnf install cmus
sudo dnf install feh
sudo dnf install terminator
sudo dnf install qutebrowser
sudo dnf install gstreamer1-libav
sudo dnf install emacs
sudo gem install meetup-cli
sudo dnf install asciinema
sudo dnf install mpv
# IMHO best cli app for weather
sudo npm install forecast-cli -g
#cmusfm
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
