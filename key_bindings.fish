bind \e\' -m vishcmd force-repaint
bind \e\' -M vishcmd -m default force-repaint
bind -M vishcmd \e -m default "commandline -f repaint"

_vish_make_regset m DIRS
_vish_bind_registers g _vish_cd_bound_dir

_vish_make_regset p PREFICES
_vish_bind_registers z _vish_toggle_cmd_prefix
_vish_bind_registers a _vish_append_cmd_prefix

_vish_bind g "_vish_prompt_toggle GIT_BRANCH"
_vish_bind s "_vish_prompt_toggle SHORT_PATH"
_vish_bind i "_vish_prompt_toggle PING"
_vish_bind h "history --merge"
