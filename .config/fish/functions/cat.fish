function cat
	for file in $argv
		if echo $file | grep .doc > /dev/null
			catdoc $file
		else if echo $file | grep .ppt > /dev/null
			catppt $file
		else if echo $file | grep .xls > /dev/null
			xls2csv $file
		else
			/bin/cat $file
		end
	end
end
