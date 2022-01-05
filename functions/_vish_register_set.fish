function _vish_register_set -a key -a name
	set -l regs _VISH_BOUND_$name
	set -l smallname (echo $name | tr [:upper:] [:lower:])
	if not set -q $regs
		return 1
	end
	_vish_register_set_to $key $name (eval _vish_source_of_$smallname)
end
