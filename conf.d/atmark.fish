function @
    if test $argv = '--help'
        __atmark_help
    else
        __atmark $argv 
    end
end

function ls@
    ls (__atmark $argv)
end

function cat@
    cat (__atmark $argv)
end

function cd@
    cd (__atmark $argv)
end

function @load
    __atmark_load
end

function @add
    __atmark_add $argv
    __atmark_load
end

function @list
    __atmark_list
end

