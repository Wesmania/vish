# Grabs lines between the last 2 prompts and selects i-th one (from start or end depending on sign).
#
# In fish_user_key_bindings:
# _vish_make_num_param_register l "_vish_last_line" --doc "Grab nth line from last command invocation."
# Call e.g. <L>1la to yank (1)st (l)ine to register 0, then (a)ppend it.
#
function _vish_last_line -a key
    # Requires tmux
    if not set -q TMUX
        return
    end

    # Put your fancy unicode prompt character that never occurs elsewhere here.
    set -l PROMPT_MAGIC_CHAR '\xe2\x9f\xa8'

    set -l i 1
    set -l area before
    set -l reverse

    if [ $key -lt 0 ] > /dev/null
        set reverse cat
    else
        set reverse tac
    end

    if [ "$key" -lt 0 ]
        set key (math "-$key")
    end
    tmux capture-pane -p | tac | while read line
        # Grab last non-empty area around 2 prompts
        if echo $line | grep (echo -n -e $PROMPT_MAGIC_CHAR) > /dev/null
            switch $area
            case before
                set area at_prompt
            case at_prompt
                continue
            case in_area
                break
            end
        else
            if [ ! $area = before ]
                echo $line
                set area in_area
            end
        end
    end | eval $reverse | while read line
        if [ "$line" = "" ]
            continue
        end
        if [ $i -eq $key ] > /dev/null
            string escape -- $line
            return
        end
        set i (math "$i + 1")
    end
end
