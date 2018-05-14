bind \e\' -m vish-cmd force-repaint
bind \e\' -M vish-cmd -m default force-repaint
bind -M vish-cmd \e -m default "commandline -f repaint"

_vish_bind_register b _vish_bind_key
_vish_bind_register e _vish_execute_bound_key
_vish_bind_register m _vish_bind_dir
_vish_bind_register - _vish_unbind_dir
_vish_bind_register g _vish_cd_bound_dir

_vish_bind g _vish_prompt_git_branch
_vish_bind s _vish_prompt_short_path
_vish_bind p _vish_prompt_ping
_vish_bind m _vish_ls_bound_dirs
_vish_bind h "history --merge"
