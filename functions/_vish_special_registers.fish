function _vish_special_registers -a action -a key -a value
	for kf in $_VISH_SPECIAL_REGISTERS
		set kv (echo $kf)
		if not echo $kv[1] | grep -qF $key
			continue
		end
		eval _vish_special_register_$kv[2] $action (string escape -- $key) (string escape -- $value)
		return
	end
	return 1
end
