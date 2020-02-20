# vish
A handful of conveniences for anyone using Fish extensively, with some vim-like syntax.
- `<Leader>` - `<register>` - `<action>` vim-like mnemonics.
- Register sets for common bits like working directories and commandline snippets,
- Statusline toggles, clipboard registers, assorted features.
- Extensible - define your own registers and bindings.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

## Installation

Vish is available as a package in [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish). Once you have oh-my-fish set up, just run:

```
omf install vish
```

## Demo

![Demo Animation](../readme/demo.gif?raw=true)

## Quick start

Set `_VISH_ESCAPE` to whatever sequence you want your leader (`<L>`) key to be. By default it's `\e'`.

### Register sets:
- `<L>am` to save current directory to register a. `<L>ag` to go to that directory. `<L>a-m` to clear register a. `<L>=m` to list directory registers.
- `<L>ap` to save current commandline to register a (separate from directory registers). `<L>aa` to append register a to commandline. `<L>ax` to execute contents. `<L>az` to prepend contents at every return to prompt, `<L>az` to turn it off again.
- `*` and `+` are clipboard registers, if you have `xsel`. Try `<L>*m <L>*a`.
- '0' is also a register, shared between all commands.
- As are '1-9' and '(-1)-(-9)', see 'custom bindings'.
- You can add custom registers, too! See examples.

### Misc bindings
- `<L><L>h` calls `history --merge`.
- `<L><L>s` toggles prompt path between short and long format.
- `<L><L>g` toogles git branch display in right prompt.
- `<L><L>i` toogles ping mode. More details below.
- Others are listed in docs.md.

### Functions

- `vish_help` - list all bindings.
- `_vish_prompt_path` - prints pwd in short or long format. Use in `fish_prompt`.
- `_vish_right_prompt_git_branch` - similar to above. Use in `fish_right_prompt`.
- `_vish_status_mark` - modal indicator. Use in `fish_mode_prompt`.
- `_vish_right_prompt_status` - Last command status.
- `_vish_right_prompt_states` - Some state indicators (backgorund jobs, ping mode).

### Misc

- Define `_vish_ping` to make long-running commands (more than `$VISH_COMMAND_PING_MIN_TIME`) ping you after completion. Anything matching a regex in `$VISH_INTERACTIVE_CMDS` won't ping.
- Disable default features by setting `$VISH_FEATURES` array. By default it's `dirs prefices prompt misc`, look at `key_bindings.fish` and disable what you please.

## Custom bindings

### Register set example
```

# Put these 2 in fish_user_key_bindings.
_vish_make_regset c GCC_COMMANDS --doc "GCC commands."	# Make a new register set
_vish_bind_registers q _compile_foo --doc "Compile foo with given gcc.	# Called when doing <L><reg>q.


function _vish_source_of_gcc_commands	# _vish_source_of_{reg_name}. Called when doing <L><reg>c.
	which gcc
end

function _compile_foo -a key
	# Can just as well not use a register set and just do things based on the key.
	set -l gcc (_vish_register_get $key GCC_COMMANDS) ; or return
	eval $gcc -o foo foo.c
end
```

### Custom registers example
```
# Put this in fish_user_key_bindings.
_vish_make_special_register '][' magic_rest --doc "This register comes from the Internet!"

function _vish_special_register_magic_rest -a action -a key -a value
	# 'key' can be '[' or ']'.
	switch $action
	case "get":
		foo
	case "set":
		bar $value
	end
end
# Now we can do <L>]g to go to directory echoed by the above.


# Put this in fish_user_key_bindings.
_vish_make_num_param_register d "tmux_pane_dir" --doc "Grab tmux pane directory."

function tmux_pane_dir -a num
	commandline -i (tmux display-message -p -F "#{pane_current_path}" -t $num)
end
# Now you can do <L>3da to put (3)rd pane (d)irectory into register 0, then (a)ppend it to your commandline.
```

### Misc example
```
# Put this in fish_user_key_bindings.
# Use e.g <L>4l or <L>-6l to call this.
_vish_bind_numbers l _last_line --doc "Paste last line from terminal."

function _last_line -a num
	# Num can be 1 to 9, or -1 to -9.
	set last_line (get_that_last_line $num)
	commandline -a $last_line
end

# Put this in fish_user_key_bindings.
_vish_bind o clear	# Now <L><L>o calls clear.
```

## More docs

Any boring details and half-baked docs can be found in docs.md.
