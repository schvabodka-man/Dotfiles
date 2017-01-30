function help
    set_color yellow
    echo "Help"
    set_color green
    echo "File Managing:"
    set_color normal
    echo "browser - run thunar as super user"
    echo "search - search files"
    echo "make-exec - make file executable"
    echo "make-iso - create iso file from folder. If there is no arg the current dir will be converted"
    set_color green
    echo "Git:"
    set_color normal
    echo "commit - push to master"
    echo "git-video - gource visualisation"
    set_color green
    echo "Math:"
    set_color normal
    echo "calc/calculator/calculate - calc math equation"
    set_color green
    echo "Syncing:"
    set_color normal
    echo "transfersh - upload file(s) to transfer.sh"
    set_color green
    echo "Google Drive:"
    set_color normal
    echo "gdrive-add - add new gdrive to pull(first argument - name, second - api token)"
    echo "gdrive-mount - mount current gdrive's to file system"
    echo "gdrive-auth - auth new gdrive acc"
    set_color green
    echo "System:"
    set_color normal
    echo "rofi-cache-clear - clear rofi cache"
    echo "xresourcesupdate - update .xresources database"
    echo "vmware-rebuild - rebuild vmware kernel modules"
    set_color green
    echo "Games:"
    set_color normal
    echo "wolfenstein3d - run brutal wolfenstein"
    echo "gog - cli for gog.com"
end
