function _vish_cd_bound_dir -a key	
	if not set -q _VISH_BOUND_DIRS
		return 1
	end
	set tgt_dir $_VISH_BOUND_DIRS[(_vish_key2idx $key)]
	if not [ "$tgt_dir" = "" ]
		cd $tgt_dir
	end
end
