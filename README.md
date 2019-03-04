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

You'll need oh-my-fish. Copy this repo to ~/.config/omf/pkg. TODO: add this to omf as a package.

## Core features

Vish leverages fish's modal key binding mechanism to provide vim-style leader-prefixed shortcuts. All vish commands start with a leader key - at the moment it's hardcoded to be an `\e'` escape sequence, so you can bind it to any free key in your favourite terminal emulator.

### Registers

Vish provides several sets of "registers" under a-z. Each register set is bound to a specific letter, with key bindings to set, print and clear their values. For example, given a register set under `x`:
* `<leader>yx` will set register `y` in the register set `x`. What register `y` is set to depends on the set itself.
* `<leader>y-x` will clear register `y`.
* `<leader>=x` will print contents of the register set.

Additional key bindings that use the register set can be defined. For example a register set `x` can define a binding for a key `z`. Pressing `<leader>yz` will then perform some action for a register `y` in that set.

### Defining registers

Registers are defined with universal variables, and are actually just arrays 26 items long. Vish provides a set of helper functions for defining your own register sets and functions that operate on them. These are:
* `_vish_make_regset letter name` - create a register set under `letter` named `name`. The register set will be kept in a `$_VISH_BOUND_${name}` universal variable.
* `_vish_bind_registers letter fn` - bind command `fn` under letter `letter`. The command should accept a single argument that's the register used. If you want to get register contents, look them up in the corresponding universal variable.
* `_vish_reg2idx` - convenience function. Turns a register letter into an index into the `$_VISH_BOUND_${name}` array.

When setting a register, `_vish_source_of_${name}` is called, with `${name}` turned lowercase. This function takes no arguments and should return the string to put into the register.

You should create register sets and bind shortcuts in your `fish_user_key_bindings` function.

### Register-less shortcuts

Shortcuts that don't use registers are bound to `<leader><leader><key>` sequences. You can use the following functions to bind a shortcut:
* `_vish_bind letter command` - bind command to a `<leader><leader><letter>` sequence. Commands are `bind`-style strings - you can e.g. write `_vish_bind a "foo bar; echo baz"` and it will work as expected.

## Default bindings

Vish provides a few bindings out-of-the-box.

### Directory set

Directory register set is bound to 'm' (similar to 'm' mark in vim). Setting a register from that set sets it to (pwd). The set has extra bindings:

* `<leader>yg` will change directory to one under register `y`.

You can use the `bound_dir x` command to print contents of register x (convenient for small scripting).

### Commandline set

Commandline register set is bound to 'p'. Setting a register from that set sets it to current commandline contents. The set has extra bindings:
* <leader>xa inserts contents of register x at current cursor position, moving the cursor to the end of inserted text.
* <leader>xz toggles 'prefix mode' on and off. In prefix mode, contents of register `x` will be prepended to commandline at every new prompt. Very convenient for commands like git!
* <leader>xx replaces your current commandline contents with contents of register x, then runs them.

You can use the `bound_prefices x` command to print contents of register x (convenient for small scripting).

### Prompt functions

Vish has a handful of prompt functions to compose your prompt with and which react to register-less shortcuts. These are:
- `_vish_prompt_path` - current directory. Can be shortened to last `$VISH_PROMPT_SHORT_PATH_MAX_LENGTH` characters with `<leader><leader>s`.
- `_vish_right_prompt_git_branch` - current git branch. Can be toggled on / off with <leader><leader>g.
- `_vish_right_prompt_states` - Vish state indicators. Currently indicate presence of background jobs and ping mode.
- `_vish_right_prompt_status` - Last command status.
- `_vish_status_mark` - emit a character depending on vish mode. To be used in `fish_mode_prompt`.

You can also toggle the above prompt changes manually (e.g. in your config.fish) - just run the `_vish_prompt_toggle NAME` with name being one of `GIT_BRANCH`, `SHORT_PATH` or `PING`.

### Ping mode

Sequence `<leader><leader>i` toggles ping mode. In ping mode, any commands (not run in background) that run longer than `$VISH_COMMAND_PING_MIN_TIME` seconds (or default 10) will call `_vish_ping` once they are done, if it's defined. Implementation of `_vish_ping` is left to the user. Any command that matches a regex in a `$VISH_INTERACTIVE_CMDS` array will be considered interactive, and won't be pinged.

### Subcommand substitution

Sequence `<leader><leader>e`, given that cursor is at the start or right after end of `(command)`, substitutes `(command)` with output of `command`.

### Other

Sequence `<leader><leader>h` calls history --merge. Convenient when working with fish in multiple tabs.

## Security

Register sets are just universal environment variables, so anything running as your user can modify them. It's especially a concern when using key sequences that execute register contents - DON'T use these if you don't trust your environment.
