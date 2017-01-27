function update-nonrepo
    echo "Updating oh-my-fish"
    omf update
    echo 'updating emacs moe theme'
    builtin cd ~/.emacs.d/moe/
    git pull
    echo 'updating elscreen for emacs'
    builtin cd ~/.emacs.d/elscreen/
    git pull
    echo 'updating tldr'
    sudo pip install tldr --upgrade
    echo "Ready!"
end
