function help
    set_color green
    echo "File Managing:"
    set_color normal
    echo "make-exec - make file executable"
    echo "make-iso - create iso file from folder. If there is no arg the current dir will be converted"
    set_color green
    echo "GPG:"
    set_color normal
    echo "export-key"
    set_color green
    echo "Packages:"
    set_color normal
    echo 'search-copr - search in copr repos'
    echo 'search-repo - search in fedora repos'
    echo "update-nonrepo - update soft not from repository"
    set_color green
    echo "Currency conversion:"
    set_color normal
    echo "usd/rur/uah/eur"
    set_color green
    echo "Diary:"
    set_color normal
    echo "now - new entry"
    set_color green
    echo "Music:"
    set_color normal
    echo "split-tracks - split flac image + cue into tracks"
	  echo "convert-to-flac - convert alac to flac"
    set_color green
    echo "Syncing:"
    set_color normal
    echo "transfersh - upload file(s) to transfer.sh"
    set_color green
    echo "System:"
    set_color normal
    echo "rofi-cache-clear - clear rofi cache"
    echo "xresourcesupdate - update .xresources database"
end
