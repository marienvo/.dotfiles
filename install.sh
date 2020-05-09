# Remove existing files
rm ~/.config/alacritty/alacritty.yml
rm ~/.zshrc
rm ~/.vimrc
rm ~/.tmux.conf
rm -rf ~/.config/nvim

# Create symlinks
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
mkdir ~/.config/nvim
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim
