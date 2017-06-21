function wavpack-to-flac
	for file in (ls *.wv)
		ffmpeg -i $file -c:a flac (echo $file | cut -f 1 -d '.').flac
	end
end
