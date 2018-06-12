function _vish_append_cmd_prefix -a key
	set -l idx (_vish_reg2idx $key)
	set -l cursor (commandline -C)
	commandline -i $_VISH_BOUND_PREFICES[$idx]
	commandline -C (math $cursor + (echo $_VISH_BOUND_PREFICES[$idx] | wc -c))
end
