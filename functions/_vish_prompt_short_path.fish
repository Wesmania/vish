function _vish_prompt_short_path
	if not set -q _VISH_PROMPT_SHORT_PATH
		set -g _VISH_PROMPT_SHORT_PATH 60
	else
		set -ge _VISH_PROMPT_SHORT_PATH
	end
end
