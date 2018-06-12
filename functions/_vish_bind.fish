function _vish_bind -a letter -a cmd
	bind -M vishcmd -m default -- $letter "$cmd; commandline -f repaint"
end
