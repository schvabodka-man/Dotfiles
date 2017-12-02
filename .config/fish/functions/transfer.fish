function transfer
	for file in $argv
		curl --upload-file $file https://transfer.sh/$file | xclip -in -selection clipboard
		notify-send -a transfer.sh "$file uploaded"
	end
end
