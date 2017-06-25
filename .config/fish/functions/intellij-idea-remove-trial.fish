function intellij-idea-remove-trial
	cd ~/.IntelliJIdea*
	rm config/eval/idea*evaluation.key
	rm config/options/options.xml
	cd ~/.java/.userPrefs/jetbrains
	rm -rf idea
	echo "Removed!"
end 
