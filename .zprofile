eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.dotfiles/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
function home () {
    cd "$(<~/.tmp_marked_working_dir)" || clear
}
home