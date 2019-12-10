function _vish_reg2idx -a key
	if test $key -ge 0 2>/dev/null
		# Integer registers
		echo $key
	end
	math (printf "%d" "'"$key) - 96
end
