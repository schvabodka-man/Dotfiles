function split-tracks -d "split cue+flac into tracks"
    set cueFile (/bin/ls | grep .cue)
    set flacFile (/bin/ls | grep .flac)
    cuebreakpoints $cueFile | shnsplit -o flac $flacFile
    cuetag.sh $cueFile split-*.flac
	/bin/rm $flacFile
end
