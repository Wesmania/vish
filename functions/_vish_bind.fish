function _vish_bind -a letter -a cmd -a norepaint
	if [ "$norepaint" = "norepaint" ]
		bind -M vishcmd -m default -- $letter "$cmd"
	else
		bind -M vishcmd -m default -- $letter "$cmd; commandline -f repaint"
	end
end
