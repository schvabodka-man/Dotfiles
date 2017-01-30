#shortcut for lgogdownloader
function gog
  switch $argv[1]
  case list
    lgogdownloader --list
  case list-detail
    lgogdownloader --list-detail
  case install
    lgogdownloader --download --game $argv[2]
  case update
    lgogdownloader --update-check
  case wishlist
    lgogdownloader --wishlist
  case '*'
    lgogdownloader $argv
  end
end
