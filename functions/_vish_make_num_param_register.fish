function _vish_make_num_param_register -a key -a fn
	argparse 'd-doc=' -- $argv
	__vish_doc _VISH_DOC_NUM_PARAM_REGISTERS $key $_flag_doc

	bind -M vishregnumcmd -m vishregcmd -- $key \
		'_vish_register_set_to 0 _ ('"$fn"' $_VISH_LAST_REGISTER) ; set -g _VISH_LAST_REGISTER 0; commandline -f repaint'
end
