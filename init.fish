# vish initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

# TODO - should I disable everything in non-interactive mode?
if not set -q VISH_FEATURES
	set -g VISH_FEATURES dirs prefices prompt misc
end

# FIXME: should I control this with VISH_FEATURES? Someone might want to use
# these, just with different bindings

if contains commands $VISH_FEATURES
	source $path/functions/_vish_command_end.fish
end
if contains prompt $VISH_FEATURES
	source $path/functions/_vish_cmd_prefix.fish
end
