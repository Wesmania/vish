function _vish_append_cmd_prefix -a key
	set -l prefix (_vish_register_get $key PREFICES) ; or return
	set -l cursor (commandline -C)
	commandline -i -- $prefix
	commandline -C -- (math $cursor + (echo $prefix | wc -c))
end
