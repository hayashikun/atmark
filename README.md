# atmark



## Install
```
$ fisher install hayashikun/atmark
```

## How to use?
```shell
$ @ -h
Usage: @ <key>
    -a --add     Add key and path
    -l --list    Show list
    -r --reload  Reload $HOME/.atmark
    -d --delete  Delete key and path
    -h --help    Show help

$ @ -l
dev	$HOME/development
ws	$HOME/workspace/
dotfiles	$HOME/.dotfiles

$ @ dev
/home/ryosuke/development

$ @ -a atmark (@ dev)/atmark
$ @ atmark
/home/ryosuke/development/atmark

$ cat $HOME/.atmark
# vim:set noet ts=16 :

dev	$HOME/development
ws	$HOME/workspace/
dotfiles	$HOME/.dotfiles
atmark	$HOME/development/atmark
```

## Useful functions
The following functions can be added to `$HOME/.config/fish/config.fish` for convenience

```fish
if type -q @
    function cd@; cd (@ $argv); end
    function cat@; cat (@ $argv); end
    function ls@; ls (@ $argv); end
    complete -c cd@ -w @
    complete -c cat@ -w @
    complete -c ls@ -w @
end
```

