function _vish_cd_bound_dir -a key
	set -l tgt_dir (_vish_register_get $key DIRS) ; or return
	cd $tgt_dir
end
