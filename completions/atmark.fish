complete -c @ -xa '--help' -d 'Help'

for c in @ ls@ cat@ cd@
    complete -c $c -xa '(__atmark_list)'
end
