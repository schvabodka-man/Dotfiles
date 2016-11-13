function transfersh
  for file in $argv
    curl --upload-file $file https://transfer.sh/$file 
  end
end
