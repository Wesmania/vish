function _vish_registers
	for n in (seq 26)
		echo -e "\x"(echo "obase=16; "(math 96 + $n) | bc)
	end
end
