function _vish_cmd_prefix --on-event fish_postexec
	if not set -q _VISH_CMD_CURRENT_PREFIX
		return
	end
	commandline -a -- $_VISH_CMD_CURRENT_PREFIX" "
	commandline -C -- (echo $_VISH_CMD_CURRENT_PREFIX" " | wc -c)
end
