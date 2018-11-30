function _vish_expand_parens
	set -l token (commandline -t)
	if [ (echo -n $token | head -c 1) != "(" -o (echo -n $token | tail -c 1) != ")" ]
		return
	end

	set -l toexpand (echo -n $token | head -c -1 | tail -c+2)
	set -l expandedtoken (eval $toexpand)
	commandline -rt $expandedtoken
end
