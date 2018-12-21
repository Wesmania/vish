bind \e\' -m vishregister force-repaint
bind \e\' -M vishregister -m vishcmd force-repaint
bind \e\' -M vishcmd -m default force-repaint

for mode in vishcmd vishregister vishregcmd
	bind \e -M $mode -m default "commandline -f repaint"
end

bind \' -M vishcmd -m vishregister force-repaint
for reg in (_vish_registers)
	bind -M vishregister -m vishregcmd -- $reg "set -g _VISH_LAST_REGISTER $reg ; commandline -f repaint"
end

_vish_make_regset m DIRS
_vish_bind_registers g _vish_cd_bound_dir

_vish_make_regset p PREFICES
_vish_bind_registers z _vish_toggle_cmd_prefix
_vish_bind_registers a _vish_append_cmd_prefix
_vish_bind_registers x _vish_execute_register_cmd

_vish_bind g "_vish_prompt_toggle GIT_BRANCH"
_vish_bind s "_vish_prompt_toggle SHORT_PATH"
_vish_bind i "_vish_prompt_toggle PING"
_vish_bind h "history --merge"
_vish_bind e "_vish_expand_parens"
