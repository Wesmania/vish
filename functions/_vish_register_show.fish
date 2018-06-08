function _vish_register_show -a name -a key
	set -l regs _VISH_BOUND_$name
	if not set -q $regs
		return 1
	end
	echo $$regs[1][(_vish_reg2idx $key)]
end
