function ape-to-flac
	for file in (/bin/ls *.ape)
		ffmpeg -i $file -c:a flac (echo $file | cut -f 1 -d '.').flac
	end
end
