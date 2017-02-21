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
sudo dnf install zathura
sudo dnf install zathura-plugins-all
sudo dnf install newsbeuter
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
#cmus feh art
builtin cd ~/.config/cmus
git clone https://github.com/TiredSounds/cmus-scripts
#steam
sudo dnf install steam
steam
builtin cd ~/.steam/steam/skins/
git clone https://github.com/Outsetini/Air-for-Steam
builtin cd Air-for-Steam/
sed -i '62s,.*,      //include "resource/themes/_light.styles",' config.ini
sed -i '63s,.*,      include "resource/themes/_dark.styles",' config.ini
sed -i '24s,.*,      //include "resource/colors/sky.styles",' config.ini
sed -i '29s,.*,      include "resource/colors/gunmetal.styles",' config.ini
#beats.io
sudo dnf install beets
sudo dnf install beets-plugins
