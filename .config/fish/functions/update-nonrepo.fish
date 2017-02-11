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
    echo "doom rpg"
    builtin cd ~/Games/Doom/Mods/DoomRPG
    git pull origin master
    echo "Air for Steam"
    builtin cd ~/.steam/steam/skins/Air-for-Steam
    git pull origin master
    sed -i '62s,.*,      //include "resource/themes/_light.styles",' config.ini
    sed -i '63s,.*,      include "resource/themes/_dark.styles",' config.ini
    sed -i '24s,.*,      //include "resource/colors/sky.styles",' config.ini
    sed -i '29s,.*,      include "resource/colors/gunmetal.styles",' config.ini
    echo "Ready!"
end
