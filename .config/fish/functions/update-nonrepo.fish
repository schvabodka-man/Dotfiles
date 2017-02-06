function update-nonrepo
    echo "Updating oh-my-fish"
    omf update
    echo 'updating tldr'
    sudo pip install tldr --upgrade
    echo "updating todo.txt"
    builtin cd /home/user/bin/otodo/
    git pull
    echo "updating installed gems"
    sudo gem update
    echo "npm packages(weather)"
    sudo npm update -g
    echo "doom rpg"
    builtin cd ~/Games/Doom/Mods/DoomRPG
    git pull origin master
    echo "Ready!"
end
