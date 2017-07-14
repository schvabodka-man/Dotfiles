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
sudo dnf install gstreamer1-libav
sudo dnf install emacs
sudo dnf install asciinema
sudo dnf install mpv
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
#cmus feh art
builtin cd ~/.config/cmus
git clone https://github.com/TiredSounds/cmus-scripts
builtin cd cmus-scripts/
sed -i '32s,.*,		setsid feh -g 900x900+1160+546 -x --zoom fill "$ART" &,' cmus-feh.sh
#beats.io
sudo dnf install beets
sudo dnf install beets-plugins
#rtorrent
sudo dnf install rtorrent
cd ~
mkdir .rtorrent.session
mkdir Torrents
#mutt
sudo dnf install mutt
