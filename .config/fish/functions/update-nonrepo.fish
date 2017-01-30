function update-nonrepo
    echo "Updating oh-my-fish"
    omf update
    echo 'updating elscreen for emacs'
    builtin cd ~/.emacs.d/elscreen/
    git pull
    echo 'updating tldr'
    sudo pip install tldr --upgrade
    echo "updating todo.txt"
    builtin cd /home/user/bin/otodo/
    git pull
    echo "Ready!"
end
