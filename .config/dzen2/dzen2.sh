#!/bin/bash

layout() {
	local layout=$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')
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
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12)  $unreadcounter"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12)  —"
	fi
}

webip() {
	local ip=$(/bin/dig +short myip.opendns.com @resolver1.opendns.com)
	if [[ $ip =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) $ip"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) —"
	fi
}

localip() {
	local hostname=$(hostname -I)
	if [[ $hostname =~ 192. ]]
	then
		local ip=$(hostname -I | perl -n -e '/(192.[0-9]+.[0-9]+.[0-9]+)/ && print "$1\n"')
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) $ip"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) —"
	fi
}

cmusformatted() {
	local artist=$(cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- | head -n 1)
	local track=$(cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3-)
	local number=$(cmus-remote -Q 2>/dev/null | grep tracknumber | cut -d " " -f 3-)
	local stat=$(cmus-remote -Q 2>/dev/null | grep status | perl -n -e '/status (.+)/ && print "$1\n"')
	if [ $stat == "stopped" ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) $artist — $number. $track"
	elif [ $stat == "playing" ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12)  $artist — $number. $track"
	elif [ $stat == "paused" ]
	then
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) $artist — $number. $track"
	else
		echo "^fn(FontAwesome-11)^fn(DroidSansMono-12) —"
	fi
}

generated_output() {
	while :; do
		local meetup=$(meetup)
		local weather=$(weather)
		local news=$(news)
		local webipt=$(webip)
		local localip=$(localip)
		local cmus=$(cmusformatted)
		local text=""

		text+="^fg(#ffffff)^fn(DroidSansMono-12) ^bg(#b22222) ^fn(FontAwesome-11)^fn(DroidSansMono-12)$meetup ^fn(powerlinesymbols-12)^fg(#b22222)^bg(#8b008b)"
		text+="^fg(#ffffff)^bg(#8b008b)^fn(DroidSansMono-12)$weather ^fn(powerlinesymbols-12)^fg(#8b008b)^bg(#7cfc00)"
		text+="^fg(#000000)^bg(#7cfc00)$news^fn(powerlinesymbols-12)^fg(#7cfc00)^bg(#f08080)"
		text+="^fg(#000000)^bg(#ff4500)$localip^fn(powerlinesymbols-12)^fg(#ff4500)^bg(#20b2aa)"
		text+="^fg(#000000)^bg(#20b2aa)$webipt^fn(powerlinesymbols-12)^fg(#20b2aa)^bg(#f08080)"
		text+="^fg(#000000)^bg(#f08080)$cmus^fn(powerlinesymbols-12)^fg(#f08080)^bg(#0e1112)"
		echo $text

		sleep 10
	done
}

fast_dzen() {
	while :; do
		local layout=$(layout)
		local time=$(date +'%a %m-%d %H:%M:%S')
		local text=""

		text+="^fg(#000000)^bg(#ffff00)$layout^fn(powerlinesymbols-12)^fg(#ffff00)^bg(#ff69b4)"
		text+="^fg(#000000)^bg(#ff69b4)^fn(DroidSansMono-12) ^fn(FontAwesome-11)^fn(DroidSansMono-12) $time ^fn(powerlinesymbols-12)^fg(#ff69b4)^bg(#0e1112)"
		echo $text

		sleep 1
	done
}

fast_dzen | dzen2 -dock -h 17 -ta l -fg "#FFFFFF" -bg "#0e1112"
# generated_output | dzen2 -dock -h 17 -ta l -fg "#FFFFFF" -bg "#0e1112"
