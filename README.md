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