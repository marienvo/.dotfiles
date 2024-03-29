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
- Install Powerline font: https://github.com/powerline/fonts/tree/master/FiraMono
- `sudo dnf install tmux zsh wmctrl xdotool zsh-syntax-highlighting autojump-zsh gnome-tweaks mp3blaster yubioath-desktop nodejs snapd golang-bin ffmpeg --skip-broken`
- `git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack` 
- Manually install Alacritty (deps first, then `cargo install alacritty`)
  - https://github.com/alacritty/alacritty/blob/master/INSTALL.md
- `sudo snap install yubioath-desktop newsboat`
- `brew install todo-txt`
  - sleek is an optional GUI app
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

## Check timedatectl

- Run `timedatectl` to check if timezone is correct (no/inactive/no) / no warnings

## Fix battery icon

- `sudo sed -i '/[General]/a\Experimental=true' /etc/bluetooth/main.conf`
- `sudo systemctl restart bluetooth`

## Replace Obsidian icon

```bash
sudo ln -sf /home/marienvanoverbeek/.dotfiles/assets/md.obsidian.Obsidian.png /var/lib/flatpak/app/md.obsidian.Obsidian/current/active/export/share/icons/hicolor/512x512/apps/md.obsidian.Obsidian.png
```

## Manual steps

- Set password policy for user:
  - `sudo chage --mindays 30 --maxdays 90 --warndays 30 marienvanoverbeek`

## Security

- Install and enable ClamAV https://www.linuxcapable.com/install-clamav-on-fedora-linux/#Updates-and-Maintenance 
- Enable firewalld (or use ufw, but don't enable both at the same time)

## Other
- Set `alt+z` to run `toggle-terminal.sh`
- Install Jetbrains toolbox via https://www.jetbrains.com/toolbox-app/
- Install Peek, and configure as default **Print** hotkey
- Gnome
  - https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/
- Set **alt-z** hotkey for `/home/marienvanoverbeek/.dotfiles/scripts/toggle-terminal.sh`
- Brave
  - Add sync code
  - Vimium C: `map p passNextKey`, `https://duckduckgo.com/?q=%s DuckDuckGo`
- Obsidian
  - configure Templater: set Template and Scripts folder

