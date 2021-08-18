# dotfiles
My personal dotfile for different environments

Cygwin (windows terminal)
Linux (vagrant box)
gitconfig (Everywhere)

## Add the config to local environment

Copy the line below into the `.bashrc` file

```console 
. ~/workspace/dotfiles/bash-config.sh  
```

## Add github config symlink

```console 
ln -s ~/workspace/dotfiles/.gitconfig ~/.gitconfig
```

## Loved tools

- Tmux: `apt-get install tmux`
