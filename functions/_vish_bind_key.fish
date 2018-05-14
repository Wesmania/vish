function _vish_bind_key -a key
	if not set -q _VISH_BOUND_KEYS
		return 1
	end
	set -l $idx (_vish_reg2idx $key)
	set -Ux _VISH_BOUND_KEYS[$idx] (commandline)
end
