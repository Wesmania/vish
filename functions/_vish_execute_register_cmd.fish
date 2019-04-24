function _vish_execute_register_cmd -a key
	set -l cmd (_vish_register_get $key PREFICES) ; or return
	commandline -r -- $cmd
	commandline -f -- execute
end
