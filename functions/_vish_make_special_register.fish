function _vish_make_special_register -a keys -a fn
	argparse 'd-doc=' -- $argv
	__vish_doc _VISH_DOC_SPECIAL_REGS $keys $_flag_doc

	set -g _VISH_SPECIAL_REGISTERS $_VISH_SPECIAL_REGISTERS $keys\n$fn
	for reg in (echo $keys | fold -w1)
		bind -M vishregister -m vishregcmd -- $reg \
			"set -g _VISH_LAST_REGISTER "(string escape $reg)" ; commandline -f repaint"
	end
end
