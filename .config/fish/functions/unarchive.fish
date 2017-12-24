function unarchive
	for arg in $argv
		set -x NAME (echo $arg | perl -n -e '/(.+)\./ && print "$1\n"')
		mkdir $NAME
		cd $NAME
		if echo $arg | grep ".tar.bz2"  > /dev/null
			tar xvjf ../$arg
		else if echo $arg | grep ".tar.gz" > /dev/null
			tar xvzf ../$arg
		else if echo $arg | grep ".tar.xz" > /dev/null
			tar xvJf ../$arg
		else if echo $arg | grep ".lzma" > /dev/null
			unlzma ../$arg
		else if echo $arg | grep ".bz2" > /dev/null
			bunzip2 ../$arg
		else if echo $arg | grep ".rar" > /dev/null
			unrar x -ad ../$arg
		else if echo $arg | grep ".gz" > /dev/null
			gunzip ../$arg
		else if echo $arg | grep ".tar" > /dev/null
			tar xvf ../$arg
		else if echo $arg | grep ".tbz2" > /dev/null
			tar xvjf ../$arg
		else if echo $arg | grep ".tgz" > /dev/null
			tar xvzf ../$arg
		else if echo $arg | grep ".zip" > /dev/null
			unzip ../$arg
		else if echo $arg | grep ".Z" > /dev/null
			uncompress ../$arg
		else if echo $arg | grep ".7z" > /dev/null
			7z x ../$arg
		else if echo $arg | grep ".xz" > /dev/null
			unxz ../$arg
		else if echo $arg | grep ".exe" > /dev/null
			cabextract ../$arg
		else
			echo 'not supported'
		end
		cd ..
	end
end
