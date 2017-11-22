xhost +SI:localuser:$USER
xsetroot -cursor_name left_ptr
xset r rate 200 60
emacs --daemon -f exwm-enable
exec emacsclient -c
