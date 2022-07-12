# README

## To install first (manually)

- (Apple only)
  - `sudo dnf install broadcom-wl`
    - `sudo dnf update` (then reboot)
- (laptops only)
  - install and configure TLP thresholds for BAT0
- Download latest rpmsphere-release rpm from
  - https://github.com/rpmsphere/noarch/tree/master/r
- `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`
- `sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm`
- Manually install Alacritty (deps first, then `cargo install alacritty`)
  - https://github.com/alacritty/alacritty/blob/master/INSTALL.md
- `sudo dnf install tmux zsh wmctrl xdotool zsh-syntax-highlighting autojump-zsh gnome-tweaks mp3blaster yubioath-desktop nodejs snapd golang-bin ffmpeg`
- `sudo snap install yubioath-desktop newsboat`
- `sudo usermod --shell /bin/zsh marienvanoverbeek`
- Setup newsboat
  - `ln -s /home/marienvanoverbeek/.dotfiles/newsboat/urls  /home/marienvanoverbeek/snap/newsboat/5842/.newsboat/urls` (target path might be different, run newsboat to check first)
  - sync feeds??
  - set colors??
- Install via git pull or curl:
  - tmux-themepack
  - oh-my-zsh
  - https://spaceship-prompt.sh/getting-started/ (use the oh-my-zsh instructions)
- Set global gitignore file: (doesn't work?)
  - `git config --global core.excludesFile '~/.dotfiles/.globalgitignore'`
  
## Run installer

- Run `./install.sh` to create symlinks

## Other
- Install Jetbrains toolbox via https://www.jetbrains.com/toolbox-app/
- Install Peek, and configure as default **Print** hotkey
- Set **alt-z** hotkey for `/home/marienvanoverbeek/.dotfiles/scripts/toggle-terminal.sh`
- Brave
  - Add sync code
  - Vimium C: `map p passNextKey`
- Obsidian
  - configure Templater: set Template and Scripts folder

