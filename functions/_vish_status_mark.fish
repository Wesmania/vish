function _vish_status_mark -a bind_mode
	switch $bind_mode
		case vishcmd
			echo 'V'
		case vishregister
			echo 'R'
		case vishregcmd
			echo 'C'
	end
end
