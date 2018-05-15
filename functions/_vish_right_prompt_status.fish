function _vish_right_prompt_status -a last_status
	set -l status_color ''
	if [ $last_status -eq 0 ]
		set status_color (set_color green)
	else
		set status_color (set_color red)
	end
	printf "[%s%d%s]" $status_color $last_status (set_color normal)
end
