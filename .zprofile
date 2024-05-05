is_macOS=false
if [[ "$OSTYPE" == "darwin"* ]]; then
  is_macOS=true
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.dotfiles/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
function home () {
    cd "$(<~/.tmp_marked_working_dir)" || clear
}
home

if $is_macOS; then
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
else
  echo "You're not on macOS"
fi