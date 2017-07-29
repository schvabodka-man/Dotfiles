function alac-to-flac
	for file in (/bin/ls *.m4a)
		ffmpeg -i $file -c:a flac (echo $file | cut -f 1 -d '.').flac
	end
end
