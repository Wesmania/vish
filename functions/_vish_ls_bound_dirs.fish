function _vish_ls_bound_dirs
	echo ""
	set -l i 0
	for key in (_vish_registers)
		set -l i (math $i + 1)
		if [ $_VISH_BOUND_DIRS[$i] != "" ]
			echo $key $_VISH_BOUND_DIRS[$i]
		end
	end
end
