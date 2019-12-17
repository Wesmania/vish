function _vish_command_end --on-event fish_postexec
	if not set -q _VISH_INTERACTIVE_COMMAND_START
		return
	end
	if not _vish_prompt_set PING
		return
	end
	for icmd in $VISH_INTERACTIVE_CMDS
		if echo $argv[1] | grep $icmd > /dev/null ^ /dev/null
			return
		end
	end

	set -l alert_time ""
	if set -q VISH_COMMAND_PING_MIN_TIME
		set alert_time $VISH_COMMAND_PING_MIN_TIME
	else
		set alert_time 10
	end

	set interval (math $CMD_DURATION / 1000)
	if [ "$interval" -ge "$alert_time" ]
		if type -q _vish_ping
			_vish_ping
		end
	end
end
