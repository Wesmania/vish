function __vish_help_printregs
	set -l rs $argv[1]
	for val in $$rs
		set -l ld (echo $val)
		echo $ld
	end | sort
end

function vish_help
	echo "Register sets:"
	__vish_help_printregs _VISH_DOC_REGSET
	echo ""
	echo "Special registers:"
	__vish_help_printregs _VISH_DOC_SPECIAL_REGS
	echo ""
	echo "Parametrized registers:"
	__vish_help_printregs _VISH_DOC_PARAM_REGISTERS
	echo ""
	echo "Parametrized registers (number):"
	__vish_help_printregs _VISH_DOC_NUM_PARAM_REGISTERS
	echo ""
	echo "Register bindings:"
	__vish_help_printregs _VISH_DOC_REG_BIND
	echo ""
	echo "Registerless bindings:"
	__vish_help_printregs _VISH_DOC_NOREG_BIND
	echo ""
	echo "Registers bound to numbers:"
	__vish_help_printregs _VISH_DOC_REG_NUMBIND
end
