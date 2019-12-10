function _vish_bind -a letter -a cmd -a norepaint
	argparse 'd-doc=' -- $argv
	__vish_doc _VISH_DOC_NOREG_BIND $letter $_flag_doc

	if [ "$norepaint" = "norepaint" ]
		bind -M vishcmd -m default -- $letter "$cmd"
	else
		bind -M vishcmd -m default -- $letter "$cmd; commandline -f repaint"
	end
end
