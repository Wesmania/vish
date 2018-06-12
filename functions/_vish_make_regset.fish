function _vish_make_regset -a letter -a name
	_vish_register_init $name
	for reg in (_vish_registers)
		bind -M vishcmd -m default -- \'$reg$letter "_vish_register_set $name $reg; commandline -f repaint"
		bind -M vishcmd -m default -- \'$reg-$letter "_vish_register_clear $name $reg ; commandline -f repaint"
		bind -M vishcmd -m default -- =$letter "_vish_register_list $name; commandline -f repaint"
	end
end
