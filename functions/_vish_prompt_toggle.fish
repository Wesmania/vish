function _vish_prompt_toggle -a name
	if not set -q _VISH_PROMPT_$name
		set -g _VISH_PROMPT_$name
	else
		set -ge _VISH_PROMPT_$name
	end
end
