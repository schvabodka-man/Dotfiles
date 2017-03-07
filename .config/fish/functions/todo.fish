function todo
	set month (date +"%m")
    set day (date +"%d")
	set year (date +"%Y")
	echo $year-$month-$day $argv >> /home/user/Dropbox/todo/todo.txt
end
