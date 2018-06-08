function _vish_register_clear -a name -a key
	set -l regs _VISH_BOUND_$name
	if not set -q $regs
		return 1
	end
	set -Ux $regs[1][(_vish_reg2idx $key)] ''
end
