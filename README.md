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

## Configuration

* Set the following variables in your config.fish, before omf hooks:
  * `_VISH_ESCAPE` to the terminal sequence you want to be your "leader" key. By default it's set to `\e'`.
  * `VISH_FEATURES` (array) to the set of features you want. Default is `dirs prefices prompt misc`, add `tmux` if you use it.
  * If you use tmux, set `_VISH_PROMPT_MAGIC_CHAR` to a character that only appears in your prompt. This helps some keybindings identify your prompt in tmux panes.

## Usage

Vish uses modal key sequences, kind of like vim does. All sequences start with the leader key `<L>`, then use some sequence of register names and commands, usually `<register><command>`. For example, `<L><L>h` calls `history --merge`, while `<L>am` saves current directory to register a. Here's a few sequences I commonly use:

* `<L>am` saves current directory to register a. `<L>ag` goes to directory under register a. `<L>=m` lists all saved directories.
* `<L>*p` saves current commandline contents to selection buffer.
* `<L>*a` appends selection buffer to commandline.
* With tmux, `<L>-1la` appends last line of command output to commandline.

To list all configured bindings with brief descriptions, run `vish_help`.

### Registers

Vish defines registers from a to z, plus some special registers. Unlike vim, there can be multiple sets of registers a-z, e.g. one for directories, one for commands etc, with each keybinding implicitly using one of them. Registers are **UNIVERSAL** and are shared between all shells. Special registers are shared by all keybindings, and by default are as follows:

* `0` is the "implicit" register.
* `*` and `+` are equivalents of vim clipboard registers. For convenience they're also mapped under `,` and `.`, respectively.
* Additionally, `<L>a*` and `<L>a+` bindings copy register 'a' to the clipboard register.

Each register set is bound to a letter. For a set bound to a letter `<x>`, `<L>a<x>` sets register a, `<L>a-<x>` clears it and `<L>=<x>` lists all letters in a set.

### Feature: directories

Enabled by `dirs` in `VISH_FEATURES`. Defines a "dirs" register set under letter m.

- `<L>am` saves current directory to register a.
- `<L>ag` goes to directory under register a. Try `<L>*g` for going to directory saved to clipboard.

### Feature: commands

Enabled by `prefices` in `VISH_FEATURES`. Defines a "prefices" register set under letter p.

- `<L>ap` to save current commandline to register a.
- `<L>aa` to append contents of register a to commandline.
- `<L>ax` to execute contents of register a.
- `<L>az` to prepend contents of register a at every prompt, `<L>az` again to turn it off.

### Feature: misc bindings

Enabled by `misc` in `VISH_FEATURES`.

- `<L><L>h` calls `history --merge`.

### Feature: prompt

Enabled by `prompt` in `VISH_FEATURES`.

For `fish_prompt`:
- `_vish_prompt_path` prints current directory in short or long format. `<L><L>s` toggles the format.

For `fish_right_prompt`:
- `_vish_right_prompt_git_branch` prints current git branch. `<L><L>g` toogles it on or off.
- `_vish_right_prompt_status` prints return code of last command.
- `_vish_right_prompt_states` prints useful status info. At the moments it prints `j` if there are background jobs and `I` if ping mode is enabled.

Each right prompt function can be toggled by calling `_vish_prompt_toggle GIT_BRANCH/PING/SHORT_PATH`, e.g. in your config.fish.

`<L><L>i` toogles ping mode on and off.
- When ping mode is on, fish will run a `_vish_ping` function, if defined, after long-running commands. It's up to you to define `_vish_ping`.
- Any command that matches a regex in `$VISH_INTERACTIVE_CMDS` array will be considered interactive and `_vish_ping` won't be called.
- By default any command that runs 10 seconds or longer is long-running. You can change that nubmer by defining `$VISH_COMMAND_PING_MIN_TIME`.

### Feature: tmux

Enabled by `tmux` in `VISH_FEATURES`.

- `<L>t<x>` for various tmux shortcuts, see `vish_help`. In particular `<L>tt` autocompletes word under cursor, searching in current window's panes.
- `<L><N>l` to copy lines from last command's output to register 0, then wait for another keybinding. For example:
  - `<L>-1la` to copy first line from the bottom to prompt.
  - `<L>3l+` to copy third line from the top to clipboard.
- `<L><N>g` to copy current directory from pane N to register 0, then wait for another keybinding. For pane 0, use -1.

### Functions

- `vish_help` - list all bindings.

## Custom bindings and scripting

It's possible to define your own registers and bindings and do some limited scripting. For details, see `custom.md`.
