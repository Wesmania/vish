function _vish_execute_register_cmd -a key
	set -l idx (_vish_reg2idx $key)
	commandline -r $_VISH_BOUND_PREFICES[$idx]
	commandline -f execute
end
