# In fish_user_key_bindings:
# _vish_bind_registers t "vish_tmux" --doc "Various vish bindings for tmux - (v)split, (h)split, resi(z)e, (d)isplay, comple(t)e."
# Use with e.g. <L>dt
function _vish_tmux -a letter
	switch $letter
		case v
			tmux split -h
		case h
			tmux split
		case z
			tmux resize-pane -Z
		case d
			tmux display-panes
		case t
			_vish_tmux_complete
	end
end
