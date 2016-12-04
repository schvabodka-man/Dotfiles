#simple script to make commits to branch
function commit -d "git commit"
  if count $argv > /dev/null
    git push origin $argv[1]
  else
    git push origin master
  end
end
