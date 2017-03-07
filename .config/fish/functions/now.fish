function now
    set date (date +"%d-%m-%Y")
	set formatdate (date +"%Y%m%d")
    set day (date +"%A")
    set time (date +"%H:%M")
    if test -e ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
	    printf "\n** $time\n" >> ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
	    printf "\n$argv\n" >> ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
    else
		touch ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
        printf "* $date" >> ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
		printf "\n** $time\n" >> ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
	    printf "\n$argv\n" >> ~/Dropbox/Org/Wiki/Personal/Diary/$formatdate
    end
end
