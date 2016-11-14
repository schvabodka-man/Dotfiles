function syncit
  if cp $argv /home/scvh/Sync > /dev/null
    notify-send -i /home/scvh/Pictures/icons/sync.png "Synced!"
    echo "Synced files $argv"
  else
    notify-send -i /home/scvh/Pictures/icons/error.png "Error in sync"
  end
end
