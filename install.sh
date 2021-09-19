#!/bin/bash
# Remove existing files
rm ~/.config/alacritty/alacritty.yml
rm ~/.config/fish/config.fish
rm ~/.zshrc
rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.taskrc
rm ~/.ideavimrc
rm -rf ~/.config/nvim

# Create symlinks
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/.dotfiles/newsboat/config ~/.config/newsboat/config
ln -s ~/.dotfiles/newsboat/urls ~/.config/newsboat/urls
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.taskrc ~/.taskrc
ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc
mkdir ~/.config/nvim
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
