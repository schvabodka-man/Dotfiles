#script for simple searching
function search
  set firstArg $argv[1]
  set secondArg $argv[2]
  clear
  if count $secondArg > /dev/null
    find $firstArg -iname "$secondArg"
  else
    locate -i $firstArg
  end
end
