function execute_bound_key -a key
	commandline -r $_VISH_BOUND_KEYS[(_vish_reg2idx $key)]
end
