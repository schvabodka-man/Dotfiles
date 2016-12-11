#script for making iso file form folder
function make-iso
  set firstArg $argv[1]
  set currentFolder (pwd)
  set thisFolderName (basename $currentFolder)
  clear
  if count $firstArg > /dev/null
    builtin cd $argv[1]
    set folderName (basename $PWD)
    genisoimage -R -o (echo $folderName.iso) $firstArg
  else
    genisoimage -R -o (echo $thisFolderName.iso) $currentFolder
  end
end
