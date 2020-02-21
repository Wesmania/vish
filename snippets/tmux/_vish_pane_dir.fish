# Grabs pwd from i-th tmux pane.
#
# In fish_user_key_bindings:
# _vish_make_num_param_register d "_vish_pane_dir" --doc "Grab path from i-th pane."
# Call e.g. <L>1da to yank (1)st (d)irectory to register 0, then (a)ppend it.
#
function _vish_pane_dir -a num
	tmux display-message -p -F "#{pane_current_path}" -t $num
end
