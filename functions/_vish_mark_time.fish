function _vish_mark_time --on-event fish_preexec
	set -g _VISH_INTERACTIVE_COMMAND_START (date +%s)
end
