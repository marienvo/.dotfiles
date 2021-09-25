# README

- Run `./install.sh` to create symlinks

## To install first (manually)

- tmux
    - tmux-themepack
- sudo apt install tmux zsh wmctrl xdotool
- Install oh-my-zsh
- Set global gitignore file:
  - `git config --global core.excludesFile './.dotfiles/.globalgitignore'`

## Other
- Set cronjob for newsboat to (`crontab -e`):
  - */20 * * * * /usr/bin/newsboat -x reload
- Vimium C
  - map p passNextKey
- Firefox
  - sync bookmarks with FF account
- Wifi Apple devices
  - https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/ - add repo
  - sudo dnf install broadcom-wl
- install yubico authenticator
  - https://snapcraft.io/install/yubioath-desktop/fedora
  - sudo systemctl stop pcscd
  - sudo systemctl stop pcscd.socket
  - sudo snap restart yubioath-desktop.pcscd
