function __atmark_load -d 'Reload key and path'
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

