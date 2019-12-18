set -l _vish_esc \e\'
if set -q _VISH_ESCAPE
	set _vish_esc $_VISH_ESCAPE
end

bind $_vish_esc -m vishregister force-repaint
bind $_vish_esc -M vishregister -m vishcmd force-repaint
bind $_vish_esc -M vishcmd -m default force-repaint

for mode in vishcmd vishregister vishregcmd vishregnumcmd
	bind \e -M $mode -m default "commandline -f repaint"
end

bind \' -M vishcmd -m vishregister force-repaint

for reg in (_vish_registers) '0'
	bind -M vishregister -m vishregcmd -- $reg "set -g _VISH_LAST_REGISTER \"$reg\" ; commandline -f repaint"
end
for num in (seq 1 9)
	bind -M vishregister -m vishregnumcmd -- $num "set -g _VISH_LAST_REGISTER \"$num\" ; commandline -f repaint"
end

_vish_make_special_register "+*" xsel --doc "X11 registers. Vim-like."

set -U _VISH_TEMP_REGISTER ""

if contains dirs $VISH_FEATURES
	_vish_make_regset m DIRS --doc "Directories. Binds current directory."
	_vish_bind_registers g _vish_cd_bound_dir --doc "Go to saved directory."
end

if contains prefices $VISH_FEATURES
	_vish_make_regset p PREFICES --doc "Commandline contents. Binds current contents."
	_vish_bind_registers z _vish_toggle_cmd_prefix --doc "Toggle prepending commandline with saved commandline contents."
	_vish_bind_registers a _vish_append_cmd_prefix --doc "Append saved commandline contents at cursor."
	_vish_bind_registers x _vish_execute_register_cmd --doc "Execute saved commandline contents."
end

if contains prompt $VISH_FEATURES
	_vish_bind g "_vish_prompt_toggle GIT_BRANCH" --doc "Toggle git branch display."
	_vish_bind s "_vish_prompt_toggle SHORT_PATH" --doc "Toggle short directory paths."
	_vish_bind i "_vish_prompt_toggle PING" --doc "Toggle ping."
end

if contains misc $VISH_FEATURES
	_vish_bind h "history --merge" --doc "Merge fish history."
	_vish_bind e "_vish_expand_parens" --doc "Expand parenthesized command under cursor."
	_vish_bind r "_vish_save_cmdline" --doc "Save current commandline to register 0."
end
