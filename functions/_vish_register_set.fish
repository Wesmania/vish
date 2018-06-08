function _vish_register_set -a name -a key
	set -l regs _VISH_BOUND_$name
	set -l smallname (echo $name | tr [:upper:] [:lower:])
	if not set -q $regs
		return 1
	end
	set -l $idx (_vish_reg2idx $key)
	set -Ux $regs[1][$idx] (eval _vish_source_of_$smallname)
end
