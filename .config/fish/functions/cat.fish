function cat
	for file in $argv
		if echo $file | grep .png > /dev/null
			or echo $file | grep .jpg > /dev/null
			or echo $file | grep .jpeg > /dev/null
			or echo $file | grep .gif > /dev/null
			if test -e ~/bin/icat/icat
				~/bin/icat/icat $file
			else
				/bin/cat $file
			end
		else if echo $file | grep .doc > /dev/null
			catdoc $file
		else if echo $file | grep .ppt > /dev/null
			catppt $file
		else if echo $file | grep .xls > /dev/null
			xls2csv $file
		else
			if test -e ~/Go/bin/ccat
				~/Go/bin/ccat $file
			else
				/bin/cat $file
			end
		end
	end
end
