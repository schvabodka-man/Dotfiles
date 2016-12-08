#adding a new gdrive by creds and name, first name than creds
function gdrive-add
  cd /home/scvh/gdrive/
  mkdir $argv[1]
  builtin cd gdrivekeys
  gdfstool auth -a /home/scvh/gdrive/gdrivekeys/$argv[1] "$argv[2]"
end
