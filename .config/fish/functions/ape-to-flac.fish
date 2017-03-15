function ape-to-flac
	set regexResult (echo $argv | perl -n -e '/(.+).ape/ && print "$1\n"')
	ffmpeg -i $argv -acodec flac $regexResult.flac 
end
