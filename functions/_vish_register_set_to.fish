function _vish_register_set_to -a key -a name -a value
	switch $key
		case (_vish_registers)
			set -l regs _VISH_BOUND_$name
			if not set -q $regs
				return 1
			end
			set -U $regs[1][(_vish_reg2idx $key)] $value
		case '0'
			set -q _VISH_TEMP_REGISTER ; or return 1
			set -U _VISH_TEMP_REGISTER $value
		case '*'
			_vish_special_registers set $key $value
	end
end
