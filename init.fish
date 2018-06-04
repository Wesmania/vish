# vish initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies


if not set -q _VISH_BOUND_KEYS
	set -Ux _VISH_BOUND_KEYS (for i in (_vish_registers) ; echo "" ; end)
end
if not set -q _VISH_BOUND_DIRS
	set -Ux _VISH_BOUND_DIRS (for i in (_vish_registers) ; echo "" ; end)
end
if not set -q _VISH_BOUND_PREFICES
	set -Ux _VISH_BOUND_PREFICES (for i in (_vish_registers) ; echo "" ; end)
end

source $path/functions/_vish_mark_time.fish
source $path/functions/_vish_command_end.fish
source $path/functions/_vish_cmd_prefix.fish
