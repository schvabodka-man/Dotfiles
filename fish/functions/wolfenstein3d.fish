#!/usr/bin/fish
function wolfenstein3d
  set bwpath '/home/scvh/Games/wad/brutralwolf3d/BW-V4.5.pk3'
  set bwmusic '/home/scvh/Games/wad/brutralwolf3d/BW-MusicPack.wad'
  gzdoom -file $bwpath $bwmusic
end
