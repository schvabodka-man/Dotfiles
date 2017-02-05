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
apm install atom-material-ui
apm install color-picker
apm install file-icons
apm install git-control
apm install highlight-selected
apm install language-emacs-lisp
apm install language-fish-shell
apm install language-ini
apm install linter
apm install linter-markdown
apm install minimap
apm install minimap-highlight-selected
apm install minimap-pigments
apm install open-recent
apm install pigments
apm install project-manager
apm install script
apm install seti-syntax
apm install term3

echo "saas"
sudo gem install saas
