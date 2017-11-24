function import-music
	for dir in $argv
		cd $dir
		if lsa ../$dir | grep ".cue" > /dev/null
			if test (lsa $argv | grep ".flac" | wc -l) -eq 1
				split-tracks
			end
		end
		if lsa ../$dir | grep ".alac" > /dev/null
			alac-to-flac
		end
		if lsa ../$dir | grep ".ape" > /dev/null
			ape-to-flac
		end
		if lsa ../$dir | grep ".wv" > /dev/null
			wavpack-to-flac
		end
		cd ..
		beet import $dir
	end
	for c in (find ~/Music -type f -iname cover.jpg)
		set coverPath (echo $c | perl -n -e '/(.+)cover/ && print "$1\n"')
		convert $c -resize 200x200 "$coverPath/cover_small.jpg"
	end
end
