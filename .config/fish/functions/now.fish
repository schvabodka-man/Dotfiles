function now
    set date (date +"%d")
    set day (date +"%A")
    set time (date +"%H:%M")
    if grep -Fxq "** $date $day" ~/Dropbox/Org/Wiki/Personal/Diary.org
	    printf "\n*** $time\n" >> ~/Dropbox/Org/Wiki/Personal/Diary.org
	    printf "\n$argv\n" >> ~/Dropbox/Org/Wiki/Personal/Diary.org
    else
        printf "** $date $day" >> ~/Dropbox/Org/Wiki/Personal/Diary.org
		printf "\n*** $time\n" >> ~/Dropbox/Org/Wiki/Personal/Diary.org
	    printf "\n$argv\n" >> ~/Dropbox/Org/Wiki/Personal/Diary.org
    end
end
