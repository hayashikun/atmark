complete -c @ -s a -l 'add' -x -d 'Adds keys and path'
complete -c @ -s l -l 'list' -d 'Shows list'
complete -c @ -s r -l 'reload' -d 'Reloads $HOME/.atmark'
complete -c @ -s d -l 'delete' -xa '(@ --list)' -d 'Deletes key and path'
complete -c @ -s h -l 'help' -d 'Shows help'

complete -c @ -xa '(@ --list)'

