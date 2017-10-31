#!/bin/bash

layout() {
	local layout=$(~/bin/xkblayout-state/xkblayout-state print "%s")
	echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) $layout"
}
meetup() {
	local meetups=$(meetup-cli)
	local date=$(echo $meetups | /bin/grep "Date:" | perl -n -e '/ +Date: (.+)/ && print "$1\n"')
	local counter=$(echo $meetups | /bin/grep "Date:" | wc -l)
	local fancy_date=$(echo $date | perl -n -e '/\w.+, (\d+ \w+ \d+ \d+:\d+)/ && print "$1\n"')
	echo $counter — $fancy_date
}

weather() {
	local unformatted=$(~/bin/ansiweather/ansiweather -l Uzhgorod -a false -s true -u metric)
	local wind=$(echo $unformatted | perl -n -e '/Wind => (.+) - H/ && print "$1\n"')
	local humidity=$(echo $unformatted | perl -n -e '/Humidity => (.+) - P/ && print "$1\n"')
	local pressure=$(echo $unformatted | perl -n -e '/Pressure => (.+)/ && print "$1\n"')
	local atall=$(echo $unformatted | perl -n -e '/=> (.+) - W/ && print "$1\n"')
	echo "$atall $wind $humidity $pressure"
}

news() {
	local unreadcounter=$(/bin/cat ~/.elfeed/index | /bin/grep unread | wc -l)
	if [ $unreadcounter -gt 0 ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13)  $unreadcounter"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13)  —"
	fi
}

webip() {
	local ip=$(/bin/dig +short myip.opendns.com @resolver1.opendns.com)
	if [[ $ip =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $ip"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) —"
	fi
}

wififormatted() {
	if /bin/nmcli dev wifi list | grep -v "SSID" | grep "^\*" > /dev/null
	then
		#little bit of overhead but who cares, it's a shell script anyway
		local wifiname=$(/bin/nmcli dev wifi list | grep -v "SSID" | perl -n -e '/\* +(\w+) +\w+ +\d+ +\d+ \w+\/\w+ +\d+ +(\W+)/ && print "$1\n"')
		local bars=$(/bin/nmcli dev wifi list | grep -v "SSID" | perl -n -e '/\* +(\w+) +\w+ +\d+ +\d+ \w+\/\w+ +\d+ +(\W+)/ && print "$2\n"')
		echo "^fn(DroidSansMono-13) $bars $wifiname"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) —"
	fi
}

battery() {
	local batt=$(upower -i $(upower -e | grep BAT))
	local state=$(echo $batt | perl -n -e '/state: +(\w+)/ && print "$1\n"')
	local percentage=$(echo $batt | perl -n -e '/percentage: +(.+)% capacity/ && print "$1\n"')
	if [ $state == "charging" ]
	then
		local time=$(echo $batt | perl -n -e '/time to full: +(.+) percentage/ && print "$1\n"')
		echo "^bg(#32cd32)^fg(#000000)^bg(#32cd32)^fn(DroidSansMono-13)⚡ $percentage% $time^fn(powerlinesymbols-12)^fg(#32cd32)^bg(#0e1112)"
	else
		local time=$(echo $batt | perl -n -e '/time to empty: +(.+) percentage/ && print "$1\n"')
		if [ $percentage -ge 85 ]
		then
			echo "^bg(#32cd32)^fg(#000000)^bg(#32cd32)^fn(FontAwesome-11)^fn(DroidSansMono-13) $percentage% $time^fn(powerlinesymbols-12)^fg(#32cd32)^bg(#0e1112)"
		elif [ $percentage -ge 75 ]
		then
			echo "^bg(#32cd32)^fg(#000000)^bg(#32cd32)^fn(FontAwesome-11)^fn(DroidSansMono-13) $percentage% $time^fn(powerlinesymbols-12)^fg(#32cd32)^bg(#0e1112)"
		elif [ $percentage -ge 50 ]
		then
			echo "^bg(#ffff00)^fg(#000000)^bg(#ffff00)^fn(FontAwesome-11)^fn(DroidSansMono-13) $percentage% $time^fn(powerlinesymbols-12)^fg(#ffff00)^bg(#0e1112)"
		elif [ $percentage -ge 25 ]
		then
			echo "^bg(#b22222)^fg(#FFFFFF)^bg(#b22222)^fn(FontAwesome-11)^fn(DroidSansMono-13) $percentage% $time^fn(powerlinesymbols-12)^fg(#b22222)^bg(#0e1112)"
		else
			echo "^bg(#b22222)^fg(#FFFFFF)^bg(#b22222)^fn(FontAwesome-11)^fn(DroidSansMono-13) $percentage% $time^fn(powerlinesymbols-12)^fg(#b22222)^bg(#0e1112)"
		fi
	fi
}

localip() {
	local hostname=$(hostname -I)
	if [[ $hostname =~ 192. ]]
	then
		local ip=$(hostname -I | perl -n -e '/(192.[0-9]+.[0-9]+.[0-9]+)/ && print "$1\n"')
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $ip"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) —"
	fi
}

cmusformatted() {
	local artist=$(cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- | head -n 1)
	local track=$(cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3-)
	local number=$(cmus-remote -Q 2>/dev/null | grep tracknumber | cut -d " " -f 3-)
	local stat=$(cmus-remote -Q 2>/dev/null | grep status | perl -n -e '/status (.+)/ && print "$1\n"')
	if [ $stat == "stopped" ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $artist — $number. $track"
	elif [ $stat == "playing" ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13)  $artist — $number. $track"
	elif [ $stat == "paused" ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $artist — $number. $track"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) —"
	fi
}

volumelevel() {
	local result=$(amixer get Master)
	local soundstate=$(echo $result | perl -n -e '/\[(\w+)\]/ && print "$1\n"' | head -n 1)
	local volume=$(echo $result | perl -n -e '/(\d+%)/ && print "$1\n"' | head -n 1)
	local volumeNumber=$(echo $volume | tr -d "%")
	if [ $soundstate == "on" ]
	then
		if [ $volumeNumber -ge 50 ]
		then
			echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $volume"
		else
			echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $volume"
		fi
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-13)MUTE — $volume"
	fi
}

downloads_aria() {
	local number=$(~/bin/aria2rpc/aria2rpc tellActive | grep gid | wc -l)
	echo "^fn(FontAwesome-11)^fn(DroidSansMono-13) $number"
}

generated_output() {
	while :; do
		local meetup=$(meetup)
		local weather=$(weather)
		local webipt=$(webip)
		local localip=$(localip)
		local wifi=$(wififormatted)
		local aria=$(downloads_aria)

		local text=""

		text+="^fg(#ffff00)^bg(#0e1112)^fn(powerlinesymbols-12)^fg(#000000)^bg(#ffff00)$aria"
		text+="^fg(#ff69b4)^bg(#ffff00)^fn(powerlinesymbols-12)^fg(#000000)^bg(#ff69b4)$wifi"	text+="^fg(#b22222)^bg(#ff69b4)^fn(powerlinesymbols-12)^fg(#ffffff)^bg(#b22222)^fn(FontAwesome-11)^fn(DroidSansMono-13)$meetup"	text+="^fg(#8b008b)^bg(#b22222)^fn(powerlinesymbols-12)^fg(#ffffff)^bg(#8b008b)^fn(DroidSansMono-13)$weather "
		text+="^fg(#ff4500)^bg(#8b008b)^fn(powerlinesymbols-12)^fg(#000000)^bg(#ff4500)$localip"
		text+="^fg(#20b2aa)^bg(#ff4500)^fn(powerlinesymbols-12)^fg(#000000)^bg(#20b2aa)$webipt"

		echo $text

		sleep 5
	done
}

fast_dzen() {
	while :; do
		local layout=$(layout)
		local time=$(date +'%a %m-%d %H:%M:%S')
		local cmus=$(cmusformatted)
		local volume=$(volumelevel)
		local battery=$(battery)
		local text=""

		text+="^p(0)^fg(#000000)^bg(#ffff00)$layout^fn(powerlinesymbols-12)^fg(#ffff00)^bg(#ff69b4)"
		text+="^fg(#000000)^bg(#ff69b4)^fn(DroidSansMono-13) ^fn(FontAwesome-11)^fn(DroidSansMono-13) $time ^fn(powerlinesymbols-12)^fg(#ff69b4)^bg(#b22222)"
		text+="^fg(#FFFFFF)^bg(#b22222)$cmus^fn(powerlinesymbols-12)^fg(#b22222)^bg(#20b2aa)"
		text+="^fg(#000000)^bg(#20b2aa)$volume^fn(powerlinesymbols-12)^fg(#20b2aa)"
		text+="$battery"
		echo $text
		sleep 1
	done
}

fast_dzen | dzen2 -dock -h 15 -ta l & generated_output | dzen2 -dock -y 1600 -h 15 -ta r
