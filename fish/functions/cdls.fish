# Custom script for listing files when moving to directory
function cdls
  cd $argv
  ls -lah
end
