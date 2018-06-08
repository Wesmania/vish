function _vish_register_list -a name
	set -l regs _VISH_BOUND_$name
	echo ""
	set -l i 0
	for key in (_vish_registers)
		set -l i (math $i + 1)
		if [ $$regs[1][$i] != "" ]
			echo $key $$regs[1][$i]
		end
	end
end
