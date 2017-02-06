#!/usr/bin/fish
mkdir ~/Games/Doom/
sudo dnf copr enable fszymanski/gzdoom
sudo dnf install gzdoom
builtin cd ~/bin/
mkdir SSGL
wget https://github.com/FreaKzero/ssgl-doom-launcher/releases/download/v1.1.1/linux64.tar.gz
tar xC SSGL/ -f linux64.tar.gz
builtin cd SSGL/
chmod +x SSGL
builtin cd ~/bin
rm linux64.tar.gz
cd ~/.local/share/applications/
echo "[Desktop Entry]

Type=Application
Version=1.1.1
Name=Doom
Comment=Doom SSGL launcher
Exec=/home/user/bin/SSGL/SSGL
Terminal=false
Categories=Games;" > Doom.desktop
builtin cd ~/Games/Doom/
mkdir IWAD
mkdir Mods
mkdir Modlist
mkdir Saves
builtin cd Saves/
cd ..
mkdir Screenshots
builtin cd IWAD/
wget http://doomgod.com/wads/iwads/doom2.7z
7z x doom2.7z
rm doom2.7z
builtin cd ~/Games/Doom/Mods/
git clone https://github.com/Kyle873/DoomRPG
