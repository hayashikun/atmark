function @ -d '@'
    function __check_dot_atmark
        if not test -f $HOME/.atmark
            touch $HOME/.atmark
        end
    end

    function __echo
        if set -l index (contains -i -- $argv $__atmark_keys)
            echo $__atmark_values[$index]
        end
    end

    function __list -d 'List of registered key and path'
        set n (count $__atmark_keys)

        if test $n = 0
            return 1
        end

        for i in (seq $n)
            echo $__atmark_keys[$i]\t$__atmark_values[$i]
        end
    end

    function __add -a k v -d 'Add key and path'
        __check_dot_atmark
        
        if test -z $k; or test -z $v
            echo "Invalid arguments"
            return 1
        end

        echo $k\t$v >> $HOME/.atmark
    end

    function __reload -d 'Reload key and path'
        __check_dot_atmark

        set -e __atmark_keys
        set -e __atmark_values
        for line in (grep -v -e '^\s*#' -e '^\s*$' $HOME/.atmark)
            set kv (string split \t $line)
            set -U __atmark_keys $__atmark_keys $kv[1]
            set -U __atmark_values $__atmark_values $kv[2]
        end
    end

    function __delete -a k -d 'Delete key and path'
        __check_dot_atmark

        mv $HOME/.atmark $HOME/.atmark.bak
        sed "/^$k\t/d" $HOME/.atmark.bak > $HOME/.atmark
    end

    function __help -d 'Help'
        printf 'Usage: @ <key>\n'
        printf '    -a --add     Add key and path\n'
        printf '    -l --list    Show list\n'
        printf '    -r --reload  Reload $HOME/.atmark\n'
        printf '    -d --delete  Delete key and path\n'
        printf '    -h --help    Show help\n'
    end

    set options a/add l/list r/reload d/delete h/help
    argparse $options -- $argv

    if set -q _flag_help
        __help
    else if set -q _flag_list
        __list
    else if set -q _flag_add
        __add $argv[1] $argv[2]
        __reload
    else if set -q _flag_reload
        __reload
    else if set -q _flag_delete
        __delete $argv[1]
        __reload
    else
        __echo
    end
end
