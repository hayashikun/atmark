function __atmark -d 'Show registered path'
    if set -l index (contains -i -- $argv $__atmark_keys)
        echo $__atmark_values[$index]
    end
end

