#!/usr/bin/fish
set bwpath '/home/scvh/Games/wad/brutralwolf3d/BW-V4.5.pk3'
set bwmusic '/home/scvh/Games/wad/brutralwolf3d/BW-MusicPack.wad'
set bwhud '/home/scvh/Games/wad/brutralwolf3d/BW-HUDPATCH.pk3'
set config '/home/scvh/.config/gzdoom/wolf3d.ini'
gzdoom -config $config -file $bwpath $bwmusic $bwhud
