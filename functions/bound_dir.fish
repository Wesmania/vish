source ~/.config/fish/functions/register/tools.fish

function bound_dir -a key
	if not set -q _VISH_BOUND_DIRS
		return 1
	end
	echo $_VISH_BOUND_DIRS[(_vish_reg2idx $key)]
end
