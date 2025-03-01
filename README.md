## ovflowd's Personal Dotfiles

![](https://imgur.com/9zfsTwH.jpg)

This repository includes ovflowd's personal dotfiles.

To install, simply open your bash or zsh terminal and run `./install.sh`. Enjoy!

### Before Starting

- **ZSH**: We use ZSH. Remember to install ZSH beforehand, or use `chsh -s /bin/zsh`.
- The `install.sh` script is compatible with Fedora, Debian, and macOS.
- This script will overwrite existing Bash Profile, ZSH, and Oh-My-ZSH environments.
- **DO NOT** run the script as **sudo/sudoer**. The script will ask for privileges when needed.
- The script can be fully executed in an unattended fashion depending on the environment (Docker/CodeSpace/CI pipelines).
- This script enables the `git rebase` strategy by default when doing pulls.
- This script enables commitizen and commitlint by default when doing commits via hook.

### Custom Bash Aliases

- `bu` - updates brew formulas and casks (if on macOS)
- `up` - goes one directory up
- `cl` - clears the console output
- `g` - git command alias
- `commit` - alias for `git cz`

#### Note for VS/GitHub CodeSpace Users

- Please install the [Hack Nerd Font](https://github.com/source-foundry/Hack) on your system. This is required for PowerLevel10K. Otherwise, the terminal will have broken icons.
- Don't forget to change the font in `Settings > Features > Terminal > Integrated: Font Family` to `'Hack Nerd Font'`.

## Contents

### Reference for Packages

- [Homebrew for Linux](https://brew.sh)
- [Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh)
- [Power Level 10K](https://github.com/romkatv/powerlevel10k)
- [Glances](https://github.com/nicolargo/glances)
- [Bat](https://github.com/sharkdp/bat)
- [The Fuck](https://github.com/nvbn/thefuck)
- [McFly](https://github.com/cantino/mcfly)
- [ZSH-Z](https://github.com/agkozak/zsh-z)
- [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [ZSH History DB](https://github.com/larkery/zsh-histdb)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- [Git LFS](https://git-lfs.github.com/)
- [Ruby Bundler](https://bundler.io/)

### Included Homebrew Packages

- bat
- dust
- fish
- gh
- git-lfs
- glances
- gnupg
- htop
- less
- nano
- nmap
- nvm
- php
- pstree
- pyenv
- pyenv-virtualenv
- rbenv
- ruby-build
- tldr
- the-fuck
- wget

### Included ZSH Plugins

- zsh-autosuggestions
- zsh-histdb
- zsh-sqlite-history-completion
- zsh-syntax-highlighting
- zsh-z

### Included Extra Packages

#### Ruby

- bundler

#### Python

- virtualenv

### Included System Packages

#### Debian/Ubuntu

- build-essentials
- commitizen (conventional commits, changelogs)
- debconf
- git
- latest node via nvm
- locales

#### Fedora/RedHat/CentOS

- @development-tools
- commitizen (conventional commits, changelogs)
- git
- latest node via nvm

#### macOS

- commitizen (conventional commits, changelogs)
- latest node via nvm
- No requirement needs to be installed

#### Windows

- Not compatible yet

## Recommendations

This section is about some personal recommendations of things you might want to install.

### Recommended Homebrew Taps

These taps are useful if you want drivers or tools that are hardware-specific, like Logitech stuff.

```shell
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts
```

### Personal Homebrew Casks

The following casks I install on every environment. They are extremely useful.

```shell
brew install --cask \
  google-chrome \
  google-drive \
  notion-calendar \
  spotify
```

- [Google Chrome](https://chrome.google.com) is a web browser that runs the V8 engine.
- [Google Drive](https://drive.google.com) is a cloud-based file management tool.
- [Spotify](https://spotify.com) is a music player and cloud-based music provider.
- [Notion Calendar](https://notion.so) is a calendar and task management tool.

### Developer Homebrew Casks

The following casks I use for development.

```shell
brew install --cask \
  docker \
  figma \
  jetbrains-toolbox \
  ngrok \
  raycast \
  sublime-text \
  visual-studio-code \
  warp
```

- [JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/) is a hub for all JetBrains IDEs and tools.
- [Sublime Text](https://www.sublimetext.com/) is a powerful text editor.
- [Docker](https://docker.com) is a container-based platform.
- [Visual Studio Code](https://code.visualstudio.com) is a code editor.
- [Ngrok](https://ngrok.com) is a tunneling tool.
- [Warp](https://warp.dev) is a VPN for developers.
- [Raycast](https://raycast.com) is a productivity tool.
- [Figma](https://www.figma.com/) is a design and prototyping tool.

#### Paid Software Casks

The following casks are paid software, but I find them essential.

```shell
brew install --cask \
  1password \
  parallels \
  pdf-expert \
  tableplus \
  transmit
```

- [1Password](https://1password.com) is a password management tool.
- [TablePlus](https://tableplus.com/) is a database management tool that supports both NoSQL and SQL-based databases.
- [Transmit](https://panic.com/transmit/) is an app for managing files over many protocols (FTP, etc.).
- [PDF Expert](https://pdfexpert.com) is a PDF management tool.
- [Parallels](https://parallels.com) is a virtualization tool.

#### Other Casks that I Use

These are casks that I personally use but you might not need.

```shell
brew install --cask \
  keepingyouawake \
  logi-options+ \
  macs-fan-control
```

- [Macs Fan Control](https://crystalidea.com/macs-fan-control) is a tool for managing your Mac fans.
- [KeepingYouAwake](https://keepingyouawake.app/) is a tool for keeping your Mac awake.
- [Logi Options+](https://support.logi.com/hc/en-us/articles/360025297913) is a tool for managing Logitech devices.

### Casks Related to Gaming

```shell
brew install --cask \
  discord \
  nvidia-geforce-now \
  sony-ps4-remote-play \
  steam
```

- [Nvidia GeForce Now](https://www.nvidia.com/en-us/geforce-now/) is a cloud-based gaming platform.
- Sony PS4 Remote Play allows you to control your PS4/PS5 remotely.
- [Steam](https://store.steampowered.com/) is a game store, launcher, and platform.
- [Discord](https://discord.com) is a chat platform designed for communities.
