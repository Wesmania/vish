function _vish_special_register_xsel -a action -a key -a value
	command -s xsel > /dev/null ; or return 1

	set -l stype
	[ "$key" = '+' ] ; and set stype '-b'; or set stype '-p'
	switch $action
		case "get"
			xsel $stype 2>/dev/null
		case "set"
			echo -n $value | xsel $stype -i 2>/dev/null
	end
end
