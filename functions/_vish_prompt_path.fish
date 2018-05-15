function _vish_prompt_path
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
	set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
	if _vish_prompt_set SHORT_PATH
		set -l plen (echo $pwd | wc -c)
		set -l short_path 50
		if [ $plen -ge $short_path ]
			set pwd "..."(echo $pwd | tail -c $short_path)
		end
	end
	echo "$pwd"
end
