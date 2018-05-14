function _vish_bind -a letter -a cmd
	for reg in (_vish_registers)
		bind -M vish-cmd -m default -- \'$reg$letter "$cmd $reg; commandline -f repaint"
	end
end
