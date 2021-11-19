## ovflowd's personal dotfiles

![](https://imgur.com/9zfsTwH.jpg)

This repository includes ovflowd's personal dotfiles.

In order to install, simply open your bash or zsh and run `./install.sh`. Have fun!

### Before starting

- **ZSH**. We use ZSH. Remember to install ZSH before, or `chsh -s /bin/zsh`
- The `install.script` is compatible with Fedora, Debian and MacOS
- This script will overwrite existing Bash Profile, ZSH and Oh-My-ZSH environments.
- **DO NOT** run the script as **sudo/sudoer** the script will ask for privileges when it needs to.
- The script can be fully executed in an unattended fashion depending of the environment (Docker/CodeSpace/CI pipelines)
- This script enables `git rebase` strategy by default when doing pulls
- This script enables commitizen and commitlint by default when doing commits via hook

### Custom Bash Aliases

- `bu` - updates brew formulas and casks (if its macOS)
- `up` - goes one directory backwards
- `cl` - clear the console output
- `g` - git command alias
- `commit` - alias to `git cz`

#### Note for VS/GitHub CodeSpace Users

- Please install the [Hack Nerd Font](https://github.com/source-foundry/Hack) on your system. This is required for PowerLevel10K. Otherwise Terminal will have broken icons.
- Don't forget to change the font on `Settings > Features > Terminal > Integrated: Font Family` to `'Hack Nerd Font'`.

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
- [Motivate](https://github.com/mubaris/motivate)
- [Commitizen](https://github.com/commitizen)
- [Conventional Commits](https://www.conventionalcommits.org)
- [Ruby Bundler](https://bundler.io/)
- [SpeedTest CLI](https://www.speedtest.net/apps/cli)

### Included Homebrew Packages

- gcc
- git-lfs
- nmap
- gnupg
- mcfly
- glances
- bat
- htop
- the-fuck
- gh
- coreutils
- sqlite
- figlet
- nvm
- python
- less
- speedtest-cli
- fish
- tldr
- byobu
- lsd
- httpie
- php
- ruby
- docker
- cocoapods (MacOS only)
- dust

### Included ZSH Plugins

- zsh-z
- zsh-syntax-highlithing
- zsh-sqlite-history-completion
- zsh-histdb
- zsh-autosuggestions
- McFly

### Included Extra Packages

#### Ruby

- bundler

#### Node.js

- nvm
- @commitlint/cli
- cz-conventional-changelog
- @commitlint/config-conventional
- eslint
- prettier
- yarn (1.x)
- ts-node
- babel-node
- cross-env
- lerna
- husky (6.x)
- gtop

#### Python

- virtualenv

### Included System Packages

#### Debian/Ubuntu

- build-essentials
- debconf
- locales
- git
- commitizen (conventional commits, changelogs)
- latest node via nvm

#### Fedora/RedHat/CentOS

- @development-tools
- git
- commitizen (conventional commits, changelogs)
- latest node via nvm

#### macOS

- No requirement needs to be installed
- commitizen (conventional commits, changelogs)
- latest node via nvm

#### Windows

- Not compatible yet

## Recommendations

This section is about some personal recommendations of things you might want to install.

### Recommended Homebrew Taps

These Taps are super interesting if you want Drivers or Tools that Hardware-specific, like Logitech Stuff

```shell
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
```

### Personal Homebrew Casks

The following Casks I install on every environment that I install. They are extremely useful.

```shell
brew install discord docker google-chrome google-drive jetbrains-toolbox spotify sublime-text
```

- [Discord](https://discord.com) is a chat platform designed for communities
- [Docker](https://docker.com) is a Container-based platform
- [Google Chrome](https://chrome.google.com) is a web browser that runs the V8 engine
- [Google Drive](https://drive.google.com) is Cloud-Based file management tool
- [JetBrains ToolBoox](https://www.jetbrains.com/toolbox-app/) is a Hub for all JetBrains IDE's and tools
- [Spotify](https://spotify.com) is a music player and cloud-based music provider
- [Sublime Tex](https://www.sublimetext.com/) is a powerfull text-editor

#### Paid Software Casks

The following Casks are Paid Softwares, but are ones that I find essential.

```shell
brew install 1password cleanmymac istat-menus tableplus transmit
```

- [1Password](https://1password.com) is a password management tool
- [CleanMyMac](https://macpaw.com/cleanmymac) is a tool for optimizing your Mac
- [iStatMenus](https://bjango.com/mac/istatmenus/) is a tool for visualizing details about your Mac's hardware
- [TablePlus](https://tableplus.com/) is a database management tool which support both NoSQL and SQL-based databases
- [Transmit](https://panic.com/transmit/) is an app for amanging files over many protocols (FTP, etc...)

#### Other Casks that I use

These below are Casks that I personally use but you might not need at all

```shell
brew install macs-fan-control gitkraken figma element authy rocket-chat slack whatsapp zoom
```

- [Macs Fan Control](https://crystalidea.com/macs-fan-control) is a tool for managing your Mac fans
- [GitKraken](https://www.gitkraken.com/) is a Git GUI
- [Figma](https://www.figma.com/) is a designing and prototyping tool
- [Element](https://element.io) is a Matrix Client
- [Rocket Chat](https://rocket.chat/) is a Slack alternative which is Open Source
- [Slack](https://slack.com) is a Chat and Communication platform for Work
- [Authy](https://authy.com/) is a 2FA tool for storing your credentials
- [WhatsApp](https://whatsapp.com) is a communication platform for mobile devices. This is their desktop client.
- [Zoom](https://zoom.us) is a platforms for making calls and meetings

### Casks Related to Gaming Stuff

```shell
brew install nvidia-geforce-now sony-ps4-remote-play steam
```

- [Nvidia GeForce Now](https://www.nvidia.com/en-us/geforce-now/) is a Cloud-based Gaming Platform
- Sony PS4 Remote Play allows you to control your PS4/PS5 remotely
- [Steam](https://store.steampowered.com/) a game store, launcher and platform
