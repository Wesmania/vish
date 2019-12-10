function _vish_bind_registers -a letter -a cmd
	argparse 'd-doc=' -- $argv
	__vish_doc _VISH_DOC_REG_BIND $letter $_flag_doc

	bind -M vishregcmd -m default -- $letter "$cmd "'$_VISH_LAST_REGISTER'"; commandline -f repaint"
end
