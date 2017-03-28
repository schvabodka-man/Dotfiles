function split-tracks -d "split cue+flac into tracks"
    set cueFile (ls | grep .cue)
    set flacFile (ls | grep .flac)
    cuebreakpoints $cueFile | shnsplit -o flac $flacFile
    cuetag.sh $cueFile split-*.flac
	rm $flacFile
end
