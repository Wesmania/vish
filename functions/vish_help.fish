function __vish_help_printregs
	set -l rs $argv[1]
	for i in (seq 26)
		if not test -n "$$rs[1][$i]"
			continue
		end
		printf "\\x"(printf %x (math 96 + $i))"\t$$rs[1][$i]\n"
	end
end

function __vish_help_printnregs
	set -l rs $argv[1]
	for i in (seq 9)
		if not test -n "$$rs[1][$i]"
			continue
		end
		printf "$i\t$$rs[1][$i]\n"
	end
end

function vish_help
	echo "Register sets:"
	__vish_help_printregs _VISH_DOC_REGSET
	echo ""
	echo "Register bindings:"
	__vish_help_printregs _VISH_DOC_REG_BIND
	echo ""
	echo "Registerless bindings:"
	__vish_help_printregs _VISH_DOC_NOREG_BIND
	echo ""
	echo "Registers bound to numbers:"
	__vish_help_printnregs _VISH_DOC_REG_NUMBIND
end
