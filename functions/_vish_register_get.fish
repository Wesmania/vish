function _vish_register_get -a key -a name
	set -l ret ''
	switch $key
		# TODO move to separate functions?
		case '+' '\*'
			command -s xsel > /dev/null ; or return 1
			set -l stype '-p'
			[ "$key" = '+' ] ; and set stype '-b'; or set stype '-p'
			set ret (xsel $stype 2>/dev/null)
		case '*'
			[ "$name" != "" ] ; or return 1
			set -q _VISH_BOUND_$name ; or return 1

			set -l idx (_vish_reg2idx $key)
			test "$idx" -ge 1 -a "$idx" -le 26; or return 1
			set -l regset _VISH_BOUND_$name
			set ret $$regset[1][$idx]
	end
	[ "$ret" != "" ] ; or return 1
	echo $ret
end
