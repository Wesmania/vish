function _vish_cd_bound_dir -a key	
	if not set -q _VISH_BOUND_DIRS
		return 1
	end
	set tgt_dir $_VISH_BOUND_DIRS[(_vish_reg2idx $key)]
	if not [ "$tgt_dir" = "" ]
		cd $tgt_dir
	end
end
