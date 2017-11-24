function wifi-formatted
	set wifi (/usr/bin/nmcli dev wifi list | grep -v "SSID")
	if echo $wifi | grep "^\*" > /dev/null
		set wifiname (echo $wifi | perl -n -e '/\* +(\w+) +\w+ +\d+ +\d+ \w+\/\w+ +\d+ +(\W+)/ && print "$1\n"')
		set bars (echo $wifi | perl -n -e '/\* +(\w+) +\w+ +\d+ +\d+ \w+\/\w+ +\d+ +(\W+)/ && print "$2\n"')
		echo "$bars $wifiname"
	else
		echo "No Wifi"
	end
end
