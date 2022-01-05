Vish provides functions that allow you to define your own registers and bindings. They're listed here, along with some examples.

## Custom bindings

Custom bindings can be defined using a `_vish_bind*` family of functions. These are placed in `fish_user_key_bindings`.

### Bind
`_vish_bind` is used to bind a function to a sequence `<L><L><letter>`, like so:
```
_vish_bind p "echo foobar" -- doc "Prints foobar to the screen."
```

### Bind registers
`_vish_bind_registers` is used to bind a function accepting a register name to a sequence `<L><register><letter>`, like so:
```
_vish_bind_registers <letter> print_basename --doc "Print directory basename"

function print_basename -a key
	set -l dir (_vish_register_get $key DIRS) ; or return
	basename $dir
end
```
Function `_vish_register_get <key> <set>` can be used to read a register value from the register set. Directory set is called DIRS, while commandline set is called PREFICES.

### Bind number
`_vish_bind_numbers` can be used to bind a function accepting a number from 1 to 9 or -1 to -9. It's bound to a sequence `<L><number><letter>`, like so:
```
_vish_bind_numbers l _last_commit --doc "Show last commit."

function _last_commit -a num
	# Num can be 1 to 9, or -1 to -9 (unused here).
	git show HEAD~$num
end
```

### Register parameter
`_vish_make_param_register` and `_vish_make_num_param_register` can be used to make a binding that calls a function, copies its output to register 0, then uses it as base for another binding. For example:
```
_vish_make_param_register l _random_word --doc "Generate random word."

function _random_word -a letter
	# FIXME assuming a-z
	aspell dump master | grep "^$letter" | shuf | head -n 1
end
```
`<L>cl*` will copy a random word starting with "c" to selection clipboard. `<L>cla` will append it to commandline. `<L>clg` will go to a directory.


### Custom registers

You can define a custom register set like so:
```
# Put this in fish_user_key_bindings.
# Register set named GCC_COMMANDS, bound to key 'c'.
_vish_make_regset c GCC_COMMANDS --doc "GCC commands."

function _vish_source_of_gcc_commands	# _vish_source_of_{reg_name}. Called when doing <L><reg>c.
	which gcc
end
```

A special register bound to an arbitrary key can be defined like so:
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
```
