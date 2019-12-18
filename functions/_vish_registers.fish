function _vish_registers
	echo -nes {\\x}(printf "%x\n" (seq 0x61 0x7a)){\n}
end
