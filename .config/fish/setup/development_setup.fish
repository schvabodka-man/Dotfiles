#!/usr/bin/fish
echo "Development stuff"
sudo dnf install redhat-rpm-config
sudo dnf install python-devel
sudo dnf install openssl-devel
sudo dnf install ruby-devel
sudo dnf install gcc-c++
sudo dnf groupinstall 'Development tools'
echo "atom.io"
sudo dnf copr enable mosquito/atom
sudo dnf install atom
