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

### Create symlinks

```console 
ln -s workspace/dotfiles/.gitconfig ~/.gitconfig  
```

### VScode
```console 
ln -s workspace/dotfiles/vscode-settings.json ~/.config/Code/User/settings.json  
ln -s workspace/dotfiles/vscode-keybindings.json ~/.config/Code/User/keybindings.json  
```
