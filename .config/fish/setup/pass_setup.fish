#!/usr/bin/fish
echo "unix pass"
sudo dnf install pass
echo "setting up git pass helper"
builtin cd ~/bin/
git clone https://github.com/languitar/pass-git-helper.git
cd ~/bin/pass-git-helper
python3 setup.py install --user
builtin cd ~/.config/
mkdir pass-git-helper
cd pass-git-helper/
git config --global credential.helper /home/user/bin/pass-git-helper/pass-git-helper
echo "[github.com*]
target=development/github/keys/schvabodka-man
skip_username=0" > git-pass-mapping.ini
