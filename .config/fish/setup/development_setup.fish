#!/usr/bin/fish
echo "Development stuff"
sudo dnf install redhat-rpm-config
sudo dnf install python-devel
sudo dnf install openssl-devel
sudo dnf install ruby-devel
sudo dnf install gcc-c++
sudo dnf groupinstall 'Development tools'
sudo dnf install glib2-devel
sudo dnf install gdk-pixbuf2-devel
sudo dnf install libcurl-devel
sudo dnf install autoconf automake
sudo dnf install cmake
sudo dnf install ffmpeg-devel
sudo dnf install SDL2_image-devel
sudo dnf install SDL2_ttf-devel
sudo dnf install openal-soft-devel
sudo dnf install sqlite-devel
sudo dnf install qt-devel
sudo dnf install emacs
echo "saas"
sudo gem install saas
