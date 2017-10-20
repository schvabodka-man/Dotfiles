function import-music
	if lsa $argv | grep ".cue"
		if test (lsa $argv | grep ".flac" | wc -l) -eq 1
			split-tracks
		end
	end
	if lsa $argv | grep ".alac"
		alac-to-flac
	end
	if lsa $argv | grep ".ape"
		ape-to-flac
	end
	if lsa $argv | grep ".wv"
		wavpack-to-flac
	end
	beet import $argv
end
