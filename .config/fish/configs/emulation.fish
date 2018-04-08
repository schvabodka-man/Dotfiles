function emulate
	set -x xaxissize (xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
	set -x yaxissize (xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
	mednafen -gb.yres $yaxissize -gb.xres $xaxissize -gba.xres $xaxissize -gba.yres $yaxissize -nes.xres $xaxissize -nes.yres $yaxissize -snes.xres $xaxissize -snes.yres $yaxissize -autosave 1 -cd.image_memcache 1 -command.toggle_fs "keyboard 102+alt" -command.0 "keyboard 48+alt" -command.1 "keyboard 49+alt" -command.2 "keyboard 50+alt" -command.3 "keyboard 51+alt" -command.4 "keyboard 52+alt" -command.5 "keyboard 53+alt" -command.6 "keyboard 54+alt" -command.7 "keyboard 55+alt" -command.8 "keyboard 56+alt" -command.9 "keyboard 57+alt" -command.reset "keyboard 114+alt" -command.load_state "keyboard 108+ctrl" -command.save_state "keyboard 115+ctrl" -command.state_slot_dec "keyboard 45" -command.state_slot_inc "keyboard 61" -cheats 1 -command.exit "keyboard 113+win" -command.toggle_help "keyboard 120+alt" $argv
end

function zx-spectrum
	fuse-gtk --machine "128" --sound --auto-load --no-aspect-hint --no-statusbar $argv
end
