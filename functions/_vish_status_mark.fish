function _vish_status_mark -a bind_mode
	switch $bind_mode
		case vish-cmd
			echo 'L'
	end
end
