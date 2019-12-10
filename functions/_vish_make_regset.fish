function _vish_make_regset -a letter -a name
	# TODO utility function
	argparse 'd-doc=' -- $argv
	__vish_doc _VISH_DOC_REGSET $letter $_flag_doc

	_vish_register_init $name
	bind -M vishregcmd -m default $letter "_vish_register_set $name "'$_VISH_LAST_REGISTER'"; commandline -f repaint"
	bind -M vishregcmd -m default -- -$letter "_vish_register_clear $name "'$_VISH_LAST_REGISTER'"; commandline -f repaint"
	bind -M vishregister -m default -- =$letter "_vish_register_list $name; commandline -f repaint"
end
