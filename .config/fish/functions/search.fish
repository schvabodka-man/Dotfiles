function search
	set flag 0
	for argument in $argv
		set slashargs (echo $argument | grep -o "/" | wc -l)
		if test $slashargs -ne 0
			set flag 1
			break
		end
	end
	if test $flag -eq 1
		find $argv
	else
		locate $argv
	end
end 
