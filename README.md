# README

## To install first (manually)

- add repo free & non free (RPM fusion)
  - https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
  - sudo dnf install broadcom-wl (Apple only)
    - sudo dnf update (then reboot)
- Download latest rpmsphere-release rpm from
  - https://github.com/rpmsphere/noarch/tree/master/r
- `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`
- manual install alacritty
  - https://github.com/alacritty/alacritty/blob/master/INSTALL.md
- sudo dnf install tmux zsh wmctrl xdotool zsh-syntax-highlighting autojump-zsh gnome-tweaks mp3blaster yubioath-desktop nodejs snapd golang-bin
- sudo snap install yubioath-desktop
- `sudo usermod --shell /bin/zsh marienvanoverbeek`
- Install via git pull or curl:
  - tmux-themepack
  - oh-my-zsh
  - https://spaceship-prompt.sh/getting-started/ (use the oh-my-zsh instructions)
- set alt-z shortkey for /home/marienvanoverbeek/.dotfiles/scripts/toggle-terminal.sh
- Set global gitignore file: (doesn't work?)
  - `git config --global core.excludesFile '~/.dotfiles/.globalgitignore'`
- Run `./install.sh` to create symlinks

## Other
- Set cronjob for newsboat to (`crontab -e`):
  - */20 * * * * /usr/bin/newsboat -x reload
- Firefox
  - sync bookmarks with FF account
- Vimium C
  - map p passNextKey

