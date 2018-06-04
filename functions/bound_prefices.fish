function bound_prefices -a key
	if not set -q _VISH_BOUND_PREFICES
		return 1
	end
	echo $_VISH_BOUND_PREFICES[(_vish_reg2idx $key)]
end
