function _vish_bind_numbers -a letter -a cmd
	argparse 'd-doc=' -- $argv
	__vish_doc _VISH_DOC_REG_NUMBIND $letter $_flag_doc

	bind -M vishregnumcmd -m default -- $letter "$cmd "'$_VISH_LAST_REGISTER'"; commandline -f repaint"
end
