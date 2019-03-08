function _vish_register_set_to -a name -a key -a value
	switch $key
		case '+' '\*'
			command -s xsel > /dev/null ; or return 1
			set -l stype ''
			[ "$key" = "+" ] ; and set stype '-b'; or set stype '-p'
			echo -n $value | xsel $stype -i 2>/dev/null
		case '*'
			set -l regs _VISH_BOUND_$name
			if not set -q $regs
				return 1
			end
			set -Ux $regs[1][(_vish_reg2idx $key)] $value
	end
end
