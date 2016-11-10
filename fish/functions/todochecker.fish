#!/usr/bin/fish
set year (date +'%Y')
set month (date +'%m')
cd /home/scvh/Notes/
cd $year
set filename "note-$year-$month.md"
echo : (grep '\[ ]' $filename | wc -l)
