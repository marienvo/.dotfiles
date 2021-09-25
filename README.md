# README

## To install first (manually)

- add repo free & non free (RPM fusion)
  - https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
- Download latest rpmsphere-release rpm from
  - https://github.com/rpmsphere/noarch/tree/master/r
- manual install alacritty
  - https://github.com/alacritty/alacritty/blob/master/INSTALL.md
- sudo dnf install tmux zsh wmctrl xdotool zsh-syntax-highlighting gnome-tweaks mp3blaster yubioath-desktop
- Install via git pull or curl:
  - tmux-themepack
  - oh-my-zsh
- Set global gitignore file:
  - `git config --global core.excludesFile './.dotfiles/.globalgitignore'`
- Run `./install.sh` to create symlinks

## Other
- Wifi Apple devices
  - sudo dnf install broadcom-wl
- install yubico authenticator (alternative if dnf install does not work - might not be needed):
  - https://snapcraft.io/install/yubioath-desktop/fedora
  - sudo systemctl stop pcscd
  - sudo systemctl stop pcscd.socket
  - sudo snap restart yubioath-desktop.pcscd
- Set cronjob for newsboat to (`crontab -e`):
  - */20 * * * * /usr/bin/newsboat -x reload
- Firefox
  - sync bookmarks with FF account
- Vimium C
  - map p passNextKey

