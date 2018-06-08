function _vish_register_set -a name -a value -a key
	set -l regs _VISH_BOUND_$name
	if not set -q $regs
		return 1
	end
	set -l $idx (_vish_reg2idx $key)
	set -Ux $regs[1][$idx] $value
end
