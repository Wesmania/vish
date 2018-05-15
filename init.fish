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
