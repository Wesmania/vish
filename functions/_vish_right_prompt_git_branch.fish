function _vish_right_prompt_git_branch
	if _vish_prompt_set GIT_BRANCH
		set -l git_branch ''
		set -l git_color (set_color yellow)

		if set git_branch (git_branch_name)
			printf "[%s%s%s]" $git_color $git_branch (set_color normal)
		end
	end
end
