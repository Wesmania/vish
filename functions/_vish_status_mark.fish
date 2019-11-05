function _vish_status_mark -a bind_mode
	switch $bind_mode
		case vishcmd
			echo (set_color purple)'V'(set_color normal)
		case vishregister
			echo (set_color green)'R'(set_color normal)
		case vishregcmd vishregnumcmd
			echo (set_color yellow)"$_VISH_LAST_REGISTER"(set_color normal)
		case "*"
			echo "N"
	end
end
