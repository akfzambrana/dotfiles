# dotfiles
My personal dotfile for different environments

Cygwin (windows terminal)
Linux (vagrant box)
gitconfig (Everywhere)

## Creating symlinks to this dotfiles
### Bash
```console 
ln -s <path of the file>/dotfiles/.bashrc-<OS name> ~/.bashrc  
```

### Git
```console 
ln -s <path of the file>/dotfiles/.gitconfig ~/.gitconfig  
```

### VScode
```console 
ln -s <path of the file>/dotfiles/vscode-settings.json ~/.config/Code/User/settings.json  
ln -s <path of the file>/dotfiles/vscode-keybindings.json ~/.config/Code/User/keybindings.json  
```