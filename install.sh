#!/bin/bash
# Remove existing files
#rm ~/.taskrc
#rm ~/.ideavimrc
#rm -rf ~/.config/nvim

# Create symlinks
mkdir ~/.config/alacritty
rm ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir ~/.config/newsboat
rm ~/.config/newsboat/config
ln -s ~/.dotfiles/newsboat/config ~/.config/newsboat/config
rm ~/.config/newsboat/urls
ln -s ~/.dotfiles/newsboat/urls ~/.config/newsboat/urls

#mkdir ~/.moc/themes
#ln -s ~/.dotfiles/.moc/themes/default ~/.moc/themes/default
#ln -s ~/.dotfiles/.moc/config ~/.moc/config

rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
#rm ~/.vimrc
#ln -s ~/.dotfiles/.vimrc ~/.vimrc
rm ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
#ln -s ~/.dotfiles/.taskrc ~/.taskrc
#ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc

#mkdir ~/.config/nvim
#ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
