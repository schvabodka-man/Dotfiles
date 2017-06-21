function ape-to-flac
	set regexResult (echo $argv | perl -n -e '/(.+).ape/ && print "$1\n"')
	for file in (ls *.ape)
		ffmpeg -i $file -acodec flac $regexResult.flac 
	end
end
