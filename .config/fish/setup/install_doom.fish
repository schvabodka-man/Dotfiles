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
builtin cd Mods/
wget http://download1339.mediafire.com/00p5m866j1zg/qpc0cog5508920p/BrutalStrifeBeta1.zip
unzip BrutalStrifeBeta1.zip
rm BrutalStrifeBeta1.zip
wget http://doomgod.com/wads/iwads/voices.7z
7z x voices.7z
rm voices.7z
cd ..
mkdir Screenshots
builtin cd IWAD/
wget http://doomgod.com/wads/iwads/doom2.7z
7z x doom2.7z
rm doom2.7z
wget http://doomgod.com/wads/iwads/heretic.7z
7z x heretic.7z
rm heretic.7z
wget http://doomgod.com/wads/iwads/strife1.7z
7z x strife1.7z
rm strife1.7z
builtin cd ..
builtin cd Mods/
git clone https://github.com/Kyle873/DoomRPG
