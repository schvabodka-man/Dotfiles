function cover
	for c in (find ~/Music -type f -iname cover.jpg)
		set coverPath (echo $c | perl -n -e '/(.+)cover/ && print "$1\n"')
		convert $c -resize 200x200 "$coverPath/cover_small.jpg"
	end
end
