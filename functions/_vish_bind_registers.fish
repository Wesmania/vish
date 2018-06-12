function _vish_bind_registers -a letter -a cmd
	bind -M vishregcmd -m default -- $letter "$cmd "'$_VISH_LAST_REGISTER'"; commandline -f repaint"
end
