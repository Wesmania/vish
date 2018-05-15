function _vish_bind_dir -a key
	if not set -q _VISH_BOUND_DIRS
		return 1
	end
	set -l idx (_vish_reg2idx $key)
	set -Ux _VISH_BOUND_DIRS[$idx] (pwd)
end
