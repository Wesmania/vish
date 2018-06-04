function _vish_toggle_cmd_prefix -a key
	if not set -q _VISH_CMD_CURRENT_PREFIX
		set -l idx (_vish_reg2idx $key)
		if [ "$_VISH_BOUND_PREFICES[$idx]" = "" ]
			return
		end
		set -g _VISH_CMD_CURRENT_PREFIX $_VISH_BOUND_PREFICES[$idx]
		_vish_cmd_prefix
	else
		set -ge _VISH_CMD_CURRENT_PREFIX
		commandline ""
	end
end
