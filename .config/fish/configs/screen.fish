function color-temperature-colder
	set -U coltemp (math $coltemp + 500)
	sct $coltemp
end

function color-temperature-warmer
	set -U coltemp (math $coltemp - 500)
	sct $coltemp
end

function brightness-up
	set -U bright (math $bright + 0.2)
	xrandr --output LVDS --brightness $bright
end

function brightness-down
	set -U bright (math $bright - 0.2)
	xrandr --output LVDS --brightness $bright
end

function brightness-default
	set -U bright 1.0
	xrandr --output LVDS --brightness 1.0
end
