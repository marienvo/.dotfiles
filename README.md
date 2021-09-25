# README

- Run `./install.sh` to create symlinks

## To install first (manually)

- add repo free & non free (RPM fusion)
  - https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
- Download latest rpmsphere-release rpm from
  - https://github.com/rpmsphere/noarch/tree/master/r
- install alacritty
- sudo dnf install tmux zsh wmctrl xdotool zsh-syntax-highlighting gnome-tweaks mp3blaster
- tmux-themepack
- Install oh-my-zsh
- Set global gitignore file:
  - `git config --global core.excludesFile './.dotfiles/.globalgitignore'`

## Other
- Wifi Apple devices
  - sudo dnf install broadcom-wl
- install yubico authenticator
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

