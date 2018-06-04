function _vish_unbind_cmd_prefix -a key
	if not set -q _VISH_BOUND_PREFICES
		return 1
	end
	set -Ux _VISH_BOUND_PREFICES[(_vish_reg2idx $key)] ''
end
