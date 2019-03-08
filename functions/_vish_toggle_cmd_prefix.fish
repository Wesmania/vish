function _vish_toggle_cmd_prefix -a key
	if not set -q _VISH_CMD_CURRENT_PREFIX
		set -l pfx (_vish_register_get $key PREFICES) ; or return
		set -g _VISH_CMD_CURRENT_PREFIX $pfx
		_vish_cmd_prefix
	else
		set -ge _VISH_CMD_CURRENT_PREFIX
		commandline ""
	end
end
