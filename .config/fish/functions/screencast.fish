function screencast
	if count $argv[1] > /dev/null
		ffmpeg -video_size (xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)x(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2) -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast $argv[1].mkv
	else
		ffmpeg -video_size (xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)x(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2) -framerate 30 -f x11grab -i :0.0 -c:v libx264 -qp 0 -preset ultrafast screencast.mkv
	end
end
