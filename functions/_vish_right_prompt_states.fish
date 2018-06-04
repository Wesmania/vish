function _vish_right_prompt_states
	set -l states ""
	if test (count (jobs)) != 0 
		set -l job_color (set_color DD00DD)
		set states $states(printf "%s%s" $job_color j)
	end
	if _vish_prompt_set PING
		set -l ping_color (set_color DDDD00)
		set states $states(printf "%s%s" $ping_color I)
	end
	if test "$states" != ""
		printf "[%s%s]" $states (set_color normal)
	end
end
