function _vish_bind_cmd_prefix -a key
	if not set -q _VISH_BOUND_PREFICES
		return 1
	end
	set -l idx (_vish_reg2idx $key)
	set -Ux _VISH_BOUND_PREFICES[$idx] (commandline)
end
