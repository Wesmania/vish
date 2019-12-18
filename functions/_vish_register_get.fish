function _vish_register_get -a key -a name
	set -l ret ''
	switch $key
		case (_vish_registers)
			[ "$name" != "" ] ; or return 1
			set -q _VISH_BOUND_$name ; or return 1

			set -l idx (_vish_reg2idx $key)
			test "$idx" -ge 1 -a "$idx" -le 26; or return 1
			set -l regset _VISH_BOUND_$name
			set ret $$regset[1][$idx]
		case '0'
			set -q _VISH_TEMP_REGISTER ; or return 1
			set ret $_VISH_TEMP_REGISTER
		case '*'
			set ret (_vish_special_registers get $key)
	end
	[ "$ret" != "" ] ; or return 1
	echo $ret
end
