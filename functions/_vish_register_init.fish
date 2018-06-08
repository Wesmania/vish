function _vish_register_init -a name
	set -l regs _VISH_BOUND_$name
	if not set -q $regs
		set -Ux $regs (for i in (_vish_registers) ; echo "" ; end)
	end
end
