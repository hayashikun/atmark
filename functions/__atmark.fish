set DOT_ATMARK $HOME/.atmark

function @ -d 'Show registered path'
    if set -l index (contains -i -- $argv $__atmark_keys)
        echo $__atmark_values[$index]
    end
end

function __check_dot_atmark
    if not test -f $DOT_ATMARK
        touch $DOT_ATMARK
    end
end

function @reload -d 'Reload key and path'
    __check_dot_atmark

    set -g __atmark_keys
    set -g __atmark_values
    for line in (grep -v -e '^\s*#' -e '^\s*$' $DOT_ATMARK)
        set kv (string split \t $line)
        set -g __atmark_keys $__atmark_keys $kv[1]
        set -g __atmark_values $__atmark_values (fish -c "echo $kv[2]")
    end
end

function @add -d 'Add key and path'
    if not test (count $argv) = 2
        echo "Invalid number of arguments."
        exit 1
    end

    echo $argv[1]\t$argv[1] >> $DOT_ATMARK 
end

function @list -d 'List of registered key and path'
    for i in (seq (count $__atmark_keys))
        echo $__atmark_keys[$i] '->' $__atmark_values[$i]
    end
end

function @help -d 'Help'
    echo "Help!"
end

function cd@ -d 'cd'
    cd (__atmark $argv)
end

function ls@ -d 'ls'
    ls (__atmark $argv)
end

function cat@ -d 'cat'
    cat (__atmark $argv)
end
