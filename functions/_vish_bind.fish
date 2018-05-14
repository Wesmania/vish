function _vish_bind -a letter -a cmd
	bind -M vish-cmd -m default -- $letter "$cmd; commandline -f repaint"
end
