function __atmark_list -d 'List of registered key and path'
    for i in (seq (count $__atmark_keys))
        echo $__atmark_keys[$i]\t$__atmark_values[$i]
    end
end


