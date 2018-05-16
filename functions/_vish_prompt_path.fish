function _vish_prompt_path
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
	set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
	set -l short_path ""
	if _vish_prompt_set SHORT_PATH
		if set -q VISH_PROMPT_SHORT_PATH_MAX_LENGTH
			set short_path $VISH_PROMPT_SHORT_PATH_MAX_LENGTH
		else
			set short_path 50
		end
		set -l plen (echo $pwd | wc -c)
		if [ $plen -ge $short_path ]
			set pwd "..."(echo $pwd | tail -c $short_path)
		end
	end
	echo "$pwd"
end
