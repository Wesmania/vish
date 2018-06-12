## vish
A handful of conveniences for anyone using Fish extensively, with some vim-like syntax.
- Implements "registers" via universal environment variables, using them for:
  - Saving and going to directories,
  - Saving, recalling and prefixing commandline with command snippets.
- A handful of quick toggles:
  - Statusline - short path, git branch.
  - Ping when a command ends.
- Vim-style mnemonics for all of the above.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

## Install

```fish
$ omf install vish
```

## Usage

### Leader key

By default, vish uses an "\e\'" escape sequence as a leader key. TODO: make it configurable. I suggest binding the sequence in your terminal to any key you don't otherwise use (like pause). My keyboard has a very handy superfluous key next to 'z' which I use as a leader.

### Registers

Vish uses register sets bound to different letters for saving and recalling things. Given a register bound to letter 'x', you can control register contents via following key sequences:
- &lt;leader&gt;'yx sets value of register y to value determined by register set bound to x.
- &lt;leader&gt;'y-x clears value of register y.
- &lt;leader&gt;=x pretty-prints contents of register set bound to x.

Currently registers consist of keys a-z. Two register sets are currently available - directory and commandline.

### Directory set

Directory register set is bound to 'm' (similar to 'm' mark in vim). Setting a register from that set sets it to (pwd). This set provides additional bindings:
- &lt;leader&gt;'yg changes directory to one saved under register y.

You can use the 'bound\_dir x' command to print contents of register x (convenient for small scripting).

### Commandline set

Commandline register set is bound to 'p'. Setting a register from that set sets it to current commandline contents. This set provides additional bindings:
- &lt;leader&gt;'ya inserts saved contents at current cursor position, moving the cursor to the end of inserted content.
- &lt;leader&gt;'yz toggles 'prefix mode' on and off. In prefix mode, contents of register 'y' (as of time of toggle) will be prepended to commandline at every new prompt. Very convenient for commands like git!

You can use the 'bound\_prefices x' command to print contents of register x (convenient for small scripting).

### Prompt functions

Vish has a handful of prompt functions to compose your prompt with and which react to toggle commands. These are:
- \_vish\_prompt\_path - current directory. Can be shortened to last $VISH\_PROMPT\_SHORT\_PATH\_MAX\_LENGTH characters with &lt;leader&gt;s.
- \_vish\_right\_prompt\_git\_branch - current git branch. Can be toggled on / off with &lt;leader&gt;g.
- \_vish\_right\_prompt\_states - Vish state indicators. Currently indicate presence of background jobs and ping mode.
- \_vish\_right\_prompt\_status - Last command status.
- \_vish\_status\_mark - emit a character depending on vish mode. To be used in fish\_mode\_prompt.

### Ping mode

Sequence &lt;leader&gt;p toggles ping mode. In ping mode, any commands (not run in background) that run longer than $VISH\_COMMAND\_PING\_MIN\_TIME seconds (or default 10) will call \_vish\_ping once they are done, if it's defined. Implementation of \_vish\_ping is left to the user. Any command that matches a regex in a $VISH\_INTERACTIVE\_CMDS array will be considered interactive, and won't be pinged.

### Other

Sequence &lt;leader&gt;h calls history --merge. Convenient when working with fish in pultiple tabs.

# License

[MIT][mit] © [Igor Kotrasinski][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/{{USER}}
[contributors]:   https://github.com/{{USER}}/plugin-vish/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
