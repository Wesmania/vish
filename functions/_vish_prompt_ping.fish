function _vish_prompt_ping
	if not set -q _VISH_PROMPT_PING
		set -g _VISH_PROMPT_PING 1
	else
		set -ge _VISH_PROMPT_PING
	end
end
