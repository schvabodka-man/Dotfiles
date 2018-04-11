function git-remote
	git remote remove origin
	git remote add origin $argv
end

function git-squash
	git reset --soft HEAD~$argv
	git commit -m 'Squashed last $argv commits'
end

function git-smart-gui
	if count $argv > /dev/null
		if git branch --list -a | grep $argv > /dev/null
			gitk $argv
		else if git ls | grep $argv > /dev/null
			gitk --all $argv
		else
			gitk $argv
		end
	else
		gitk --all
	end
end

function git-lock-remove
	rm (git rev-parse --show-toplevel)/.git/index.lock
end
