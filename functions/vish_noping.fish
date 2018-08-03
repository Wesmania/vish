function vish_noping
	eval (set -l _st $status ; string escape -- $argv ; sh -c "exit $_st")
end
