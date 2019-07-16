function _vish_save_cmdline
	set -l cmdnow (commandline)
	if [ "$cmdnow" = "" ]
		commandline $_VISH_TEMP_REGISTER
	else
		set -U _VISH_TEMP_REGISTER $cmdnow
		commandline ""
	end
end
