# vish initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

if not set -q VISH_FEATURES
	set -g VISH_FEATURES dirs prefices prompt misc
end

# FIXME: should I control this with VISH_FEATURES? Someone might want to use
# these, just with different bindings
source $path/functions/_vish_command_end.fish
source $path/functions/_vish_cmd_prefix.fish
