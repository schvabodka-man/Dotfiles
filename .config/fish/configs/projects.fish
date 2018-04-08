#aliases for creating projects
alias project 'touch .projectile'
function project-js
	touch .indium
	touch .projectile
	touch .tern-project
	touch .csswatcher
	touch .tern-project
	# echo "{
	# \"libs\": [
	# \"browser\",
	# \"jquery\",
	# \"express\",
	# \"prism\"
	# ],
	# \"plugins\": {
	# \"node\": {}
	# }
	# }" >> .tern-project
end
alias project-javascript 'project-js'
alias javascript-project 'project-js'
alias js-project 'project-js'
