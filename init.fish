# vish initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies


_vish_register_init KEYS
_vish_register_init DIRS
_vish_register_init PREFICES

source $path/functions/_vish_mark_time.fish
source $path/functions/_vish_command_end.fish
source $path/functions/_vish_cmd_prefix.fish
