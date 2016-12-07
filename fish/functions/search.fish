#script for simple searching
function search
  set firstArg (echo $argv[1])
  set secondArg (echo $argv[2])
  if count $secondArg > /dev/null
    find $firstArg -iname "$secondArg"
  else
    locate -i $firstArg
  end
end
