function transfersh
  set icon '/home/scvh/Pictures/icons/upload.png'
  for file in $argv
    notify-send -i $icon "Uploading $file"
    curl --upload-file $file https://transfer.sh/$file | xclip -selection clipboard
  end
  notify-send -i $icon "All files uploaded"
end
