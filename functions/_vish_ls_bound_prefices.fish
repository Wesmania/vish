function _vish_ls_bound_prefices
	echo ""
	set -l i 0
	for key in (_vish_registers)
		set -l i (math $i + 1)
		if [ $_VISH_BOUND_PREFICES[$i] != "" ]
			echo $key $_VISH_BOUND_PREFICES[$i]
		end
	end
end
