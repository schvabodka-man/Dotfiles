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
echo "atom.io"
sudo dnf copr enable mosquito/atom
sudo dnf install atom
echo "saas"
sudo gem install saas
