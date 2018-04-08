#gpg
function gpg-export-key
	gpg2 --export-secret-key $argv --armor > $argv.asc
end

function gpg-encrypt
	gpg2 -e -r $argv
end

function gpg-decrypt
	gpg2 -d $argv
end
