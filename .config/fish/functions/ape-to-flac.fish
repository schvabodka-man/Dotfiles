function ape-to-flac
	for file in (ls *.ape)
		ffmpeg -i $file -c:a flac (echo $file | cut -f 1 -d '.').flac
	end
end
