function transfersh
  set icon '/home/scvh/Pictures/icons/upload.png'
  for file in $argv
    curl --upload-file $file https://transfer.sh/$file | xclip -selection clipboard
    notify-send -i $icon "Uploading $file"
  end
  notify-send -i $icon "All files uploaded"
end
