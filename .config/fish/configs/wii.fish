function iso-to-wbfs
	set filename (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"')
	wit copy --source $argv --wbfs -d $filename.wbfs -v
end

function mkfs-wbfs
	wwt format -v -f $argv
end

function wbfs-ls
	wwt LIST-L $argv
end
alias wbfs-list 'wbfs-ls'

function wbfs-check
	wwt CHECK -v $argv
end

function wii-mount
	mkdir ~/Wii
	curlftpfs 192.168.2.15 ~/Wii/
end

function wii-unmount
	fusermount -u ~/Wii
	/bin/rm -rf ~/Wii
end
alias wii-umount 'wii-unmount'
