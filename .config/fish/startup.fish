function emacs-startup
	if test -e /usr/bin/proxychains
		proxychains /usr/bin/emacs --daemon
	else
		/usr/bin/emacs --daemon
	end
end

function transmission-startup
	if test -e /usr/bin/proxychains
		proxychains transmission-daemon --foreground -T --download-dir ~/Downloads
	else
		transmission-daemon --foreground -T --download-dir ~/Downloads
	end
end

function ntp-startup
	if test -e /usr/bin/proxychains
		proxychains ntpstat
	else
		ntpstat
	end
end

function aria2-startup
	if test -e /usr/bin/proxychains
		proxychains aria2c --enable-rpc --rpc-listen-all --continue=true --save-session-interval=120 --dir=/home/$USER/Downloads --no-conf=true --save-session=/home/$USER/aria2/session --input-file=/home/$USER/aria2/session
	else
		aria2c --enable-rpc --rpc-listen-all --continue=true --save-session-interval=120 --dir=/home/$USER/Downloads --no-conf=true --save-session=/home/$USER/aria2/session --input-file=/home/$USER/aria2/session
	end
end

function offlineimap-startup
	if test -e /usr/bin/proxychains
		proxychains python3 ~/bin/offlineimap-daemon/offlineimap-daemon.py
	else
		python3 ~/bin/offlineimap-daemon/offlineimap-daemon.py
	end
end
