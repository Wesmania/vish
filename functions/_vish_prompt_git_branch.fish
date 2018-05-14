function _vish_prompt_git_branch
	if not set -q _VISH_PROMPT_GIT_BRANCH
		set -g _VISH_PROMPT_GIT_BRANCH
	else
		set -ge _VISH_PROMPT_GIT_BRANCH
	end
end
