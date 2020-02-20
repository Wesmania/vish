function _vish_copy_to_x -a key -a reg
	_vish_register_set_to PREFICES $key (_vish_register_get $reg PREFICES)
end
