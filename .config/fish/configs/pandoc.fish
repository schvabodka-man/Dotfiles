#pandoc macro
function html-to-pdf
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').pdf
end
function html-to-docx
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').docx
end
function markdown-to-pdf
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').pdf
end
function markdown-to-docx
	pandoc -S $argv -o (echo $argv | perl -n -e '/(.+)\./ && print "$1\n"').docx
end
alias html-to-doc 'html-to-docx'
alias markdown-to-doc 'markdown-to-docx'
alias md-to-doc 'markdown-to-docx'
alias md-to-docx 'markdown-to-docx'
alias md-to-pdf 'markdown-to-pdf'
