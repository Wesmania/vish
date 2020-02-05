# vish
A handful of conveniences for anyone using Fish extensively, with some vim-like syntax.
- Implements "registers" via universal environment variables, using them for:
  - Saving and going to directories,
  - Saving, recalling and prefixing commandline with command snippets.
- A handful of quick toggles:
  - Statusline - short path, git branch.
  - Ping when a command ends.
- Vim-style mnemonics for all of the above.
- Provides functions for setting up you own register sets, actions, and shortcuts.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

## Installation

Vish is available as a package in [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish). Once you have oh-my-fish set up, just run:

```
omf install vish
```

## Demo

![Demo Animation](../readme/demo.gif?raw=true)

## Core features

Vish leverages fish's modal key binding mechanism to provide vim-style leader-prefixed shortcuts. All vish commands start with a leader key - by default an `\e'` sequence, overridable by contents of a `_VISH_ESCAPE` variable.

### Registers

Vish provides several sets of "registers" under a-z. Each register set is bound to a specific letter, with key bindings to set, print and clear their values. For example, given a register set under `x`:
* `<leader>yx` will set register `y` in the register set `x`. What register `y` is set to depends on the set itself.
* `<leader>y-x` will clear register `y`.
* `<leader>=x` will print contents of the register set.

Additional key bindings that use the register set can be defined. For example a register set `x` can define a binding for a key `z`. Pressing `<leader>yz` will then perform some action for a register `y` in that set.

### Special registers

Apart from register sets, there are 2 registers under `*` and `+` that behave exactly like vim's selection registers, provided that you have the `xsel` command. These registers are shared between all register sets, can be used for all commands using them and respond to register set and clear commands. You can define other such custom registers as well.

Additionally, there's a temporary register intended to work like vim's "0" register. It's implicitly used by some commands, shared by all register sets and can be accessed under "0".

If you have a command that can accept a number, you can bind it to use numbers from 1 to 9 (and, prefixed with '-', from -9 to -1) as registers.

### Register-less shortcuts

Shortcuts that don't use registers are bound to `<leader><leader><key>` sequences.

## Default bindings

Vish provides a few bindings out-of-the-box. For a quick overview, use `vish_help`.

You can control which bindings are enabled by changing the `$VISH_FEATURES` array. By default the array is set to `dirs prefices prompt misc`. If you change it, make sure to set it **before** sourcing oh-my-fish init files.

### Directory set (dirs)

Directory register set is bound to 'm' (similar to 'm' mark in vim). Setting a register from that set sets it to `(pwd)`. The name of this set is DIRS. The set has extra bindings:

* `<leader>yg` will change directory to one under register `y`.

You can use the `bound_dir x` command to print contents of register x (convenient for small scripting).

### Commandline set (prefices)

Commandline register set is bound to 'p'. Setting a register from that set sets it to current commandline contents. The name of this set is PREFICES. The set has extra bindings:
* `<leader>xa` inserts contents of register x at current cursor position, moving the cursor to the end of inserted text.
* `<leader>xz` toggles 'prefix mode' on and off. In prefix mode, contents of register `x` will be prepended to commandline at every new prompt. Very convenient for commands like git!
* `<leader>xx` replaces your current commandline contents with contents of register x, then runs them.

You can use the `bound_prefices x` command to print contents of register x (convenient for small scripting).

### Misc bindings (misc)

- Sequence `<leader><leader>h` calls history --merge. Convenient when working with fish in multiple tabs.
- Sequence `<leader><leader>r` saves current commandline contents to register 0 if commandline is not empty, otherwise it restores commandline contents from register 0. Very handy for saving a partially typed command if you need to run something else first.
- Sequence `<leader><leader>i` toggles ping mode. In this mode, any foreground commands that took more than `$VISH_COMMAND_PING_MIN_TIME` seconds (default 10) will call `_vish_ping` once they're done. Implementation of `_vish_ping` is left to the user. Commands that match a regex in `$VISH_INTERACTIVE_CMDS` array won't be pinged.
- Sequence `<leader><leader>e`, given that cursor is at the start or right after end of `(command)`, substitutes `(command)` with output of `command`.

### Prompt functions (prompt)

Vish has a handful of prompt functions to compose your prompt with and which react to register-less shortcuts. These are:
- `_vish_prompt_path` - current directory. Can be shortened to last `$VISH_PROMPT_SHORT_PATH_MAX_LENGTH` characters with `<leader><leader>s`.
- `_vish_right_prompt_git_branch` - current git branch. Can be toggled on / off with `<leader><leader>g`.
- `_vish_right_prompt_states` - Vish state indicators. Indicate presence of background jobs and ping mode.
- `_vish_right_prompt_status` - Last command status.
- `_vish_status_mark` - emit a character depending on vish mode. To be used in `fish_mode_prompt`.

You can toggle the above prompt changes manually (e.g. in your config.fish) - just run the `_vish_prompt_toggle NAME` with name being one of `GIT_BRANCH`, `SHORT_PATH` or `PING`.

## Custom bindings

### Defining registers

Registers are defined with universal variables, and are actually just arrays 26 items long. Vish provides a set of helper functions for defining your own register sets and binding commands:
* `_vish_make_regset letter name` - create a register set under `letter` named `name`. The register set will be kept in a `$_VISH_BOUND_${name}` universal variable.
* `_vish_make_special_register keys fn` - Create a special register under each character in `keys`. To get and set this register, `_vish_special_register_${fn}` will be called, with "get" and key to fetch a value and "set", key and a value to set it. This is used to provide bindings to x11 clipboards, for example.
* `_vish_bind_registers letter fn` - bind command `fn` under letter `letter`. The command should accept a single argument that's the register used.
* `_vish_bind_numbers letter fn` - bind command `fn` under letter `letter`, accepting numbers from 1 to 9 instead of letter registers.
* `_vish_bind letter command` - bind command to a `<leader><leader><letter>` sequence. Commands are `bind`-style strings - you can e.g. write `_vish_bind a "foo bar; echo baz"` and it will work as expected.

Each of these functions accepts a `--doc` flag with an argument that will be displayed when calling `fish_help`.

There are also some utility functions available:
* `_vish_register_get key name` - given a key and a register set name, writes register contents on stdout, either from a register set or a special register. Returns 1 if register is unset or invalid.

When setting a register, `_vish_source_of_${name}` is called, with `${name}` turned lowercase. This function takes no arguments and should return the string to put into the register. 

You should create register sets and bind shortcuts in your `fish_user_key_bindings` function.

## Security

Register sets are just universal environment variables, so anything running as your user can modify them. It's especially a concern when using key sequences that execute register contents - DON'T use these if you don't trust your environment.
