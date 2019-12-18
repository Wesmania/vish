function __vish_doc -a rs -a letter -a doc
	test -n $doc ; and set -l ndoc $doc ; or set -l ndoc " "
	if contains $letter (printf "%s\n" $$rs)
		return
	end
	set -g $rs $$rs $letter\n$ndoc
end
