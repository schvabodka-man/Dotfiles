# Custom script for listing files when moving to directory
function cd
  builtin cd $argv
  exa
end
