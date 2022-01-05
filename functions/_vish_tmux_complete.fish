function _vish_tmux_complete
	# Completes current token with the first word (bottom-up) it can find
	# in the current pane. Prefers matches from start of word.
	#
	# TODO might have issues with grep's special characters.

	# Requires tmux
	if not set -q TMUX
		return
	end

	# Reasonable defaults for word boundaries.
	set -l boundary "-\./_[:alnum:]:"

	# Takes care of most grep special characters.
	set -l word (commandline -t | sed 's@\([][\.\\]\)@\\\\\1@g')

	set -l start_pattern "\(^\|[^$boundary]\)"$word"[$boundary]*"
	set -l mid_pattern "[$boundary]*"$word"[$boundary]*"

	for pattern in $start_pattern $mid_pattern
		# Don't match the line the cursor is at, otherwise fish completion hints mess with tmux completion.
		set -l endline (math (tmux display-message -p '#{cursor_y}') - 1)
		set -l replacement (tmux capture-pane -Jp -E $endline | grep -o $pattern | tail -n 1)
		# Fix start pattern grabbing the first non-word character
		set replacement (echo $replacement | grep -o $mid_pattern)
		if count $replacement > /dev/null
			commandline -rt $replacement
		end
	end
end
