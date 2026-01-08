#!/bin/bash
rm ~/.config/kitty/kitty.conf
ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf

mkdir ~/.todo
rm ~/.todo/config
ln -s ~/.dotfiles/todo-config.txt ~/.todo/config

#mkdir ~/.moc/themes
#ln -s ~/.dotfiles/.moc/themes/default ~/.moc/themes/default
#ln -s ~/.dotfiles/.moc/config ~/.moc/config

rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
rm ~/.zprofile
ln -s ~/.dotfiles/.zprofile ~/.zprofile
rm ~/.huskyrc
ln -s ~/.dotfiles/.huskyrc ~/.huskyrc
#rm ~/.vimrc
#ln -s ~/.dotfiles/.vimrc ~/.vimrc
rm ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
#ln -s ~/.dotfiles/.taskrc ~/.taskrc
#ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc


rm ~/.XCompose
ln -s ~/.dotfiles/.XCompose ~/.XCompose

#mkdir ~/.config/nvim
#ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim

# fix for snap (Fedora)
sudo ln -s /var/lib/snapd/snap /snap

# install deno (for running TS files)
curl -fsSL https://deno.land/install.sh | sh
