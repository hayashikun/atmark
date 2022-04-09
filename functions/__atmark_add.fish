function __atmark_add -d 'Add key and path'
    if not test -f $HOME/.atmark
        touch $HOME/.atmark
    end

   if not test (count $argv) = 2
        echo "Invalid number of arguments."
        exit 1
    end

    echo $argv[1]\t$argv[1] >> $HOME/.atmark 
end

