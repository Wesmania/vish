function _vish_bind_numbers -a letter -a cmd
	bind -M vishregnumcmd -m default -- $letter "$cmd "'$_VISH_LAST_REGISTER'"; commandline -f repaint"
end
