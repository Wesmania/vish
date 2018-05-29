function _vish_unbind_dir -a key
	if not set -q _VISH_BOUND_DIRS
		return 1
	end
	set -Ux _VISH_BOUND_DIRS[(_vish_reg2idx $key)] ''
end
