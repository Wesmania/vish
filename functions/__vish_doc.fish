function __vish_doc -a rs -a letter -a doc
	test -n $doc ; and set -l ndoc $doc ; or set -l ndoc " "
	set -gx $rs[1][(_vish_reg2idx $letter)] $ndoc
end
