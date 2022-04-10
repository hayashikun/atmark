function @ -d '@'
    
    function __help -d 'Help'
        printf 'Usage: @ <key>\n'
        printf '    -a --add     Adds key and path\n'
        printf '    -l --list    Shows list\n'
        printf '    -r --reload  Reloads $HOME/.atmark\n'
        printf '    -d --delete  Deletes key and path\n'
        printf '    -h --help    Shows help\n'
    end

    function __list -d 'List of registered key and path'
        for i in (seq (count $__atmark_keys))
            echo $__atmark_keys[$i]\t$__atmark_values[$i]
        end
    end

    function __add -d 'Add key and path'
        if not test -f $HOME/.atmark
            touch $HOME/.atmark
        end

        set key $argv[2]
        set value $argv[3]

       if test -z $key; or test -z $value
            echo "Invalid arguments"
            exit 1
        end

        echo $key\t$value >> $HOME/.atmark
    end

    function __reload -d 'Reload key and path'
        if not test -f $HOME/.atmark
            touch $HOME/.atmark
        end

        set -e __atmark_keys
        set -e __atmark_values
        for line in (grep -v -e '^\s*#' -e '^\s*$' $HOME/.atmark)
            set kv (string split \t $line)
            set -U __atmark_keys $__atmark_keys $kv[1]
            set -U __atmark_values $__atmark_values (fish -c "echo $kv[2]")
        end
    end


    set options e/echo h/help a/add l/list r/remove
    argparse $options -- $argv


    if set -q _flag_help
        __help
    else if set -q _flag_list
        __list
    else if set -q _flag_add
        __add
    else if set -q _flag_reload
        __reload
    else
        if set -l index (contains -i -- $argv $__atmark_keys)
            echo $__atmark_values[$index]
        end
    end
end
