#!/usr/bin/env zsh

# Sets current StdOut to another reference
exec 5<&1

attention () { echo "\e[31m!! WARNING: $1 ... \e[39m\n" >&5 }
error () { echo "\e[32m[DOT]\e[31m $1 ... \e[39m\n" >&5 }
warning () { echo "\e[32m[DOT]\e[33m $1 ... \e[39m\n" >&5 }
log () { echo "\e[32m[DOT]\e[34m $1 ... \e[39m\n" >&5 }

echo "\n!! NOTICE: Logs are going to be generated on log.log and error_log.log. You can see real-time updates in the log files. !! \n"

attention "This script will overwrite existing ZSH, Bash Profile and Oh-My-ZSH configurations !!"
attention "Please do not open other terminal session until the scripts finishes !!"

(
    case "$(uname -s)" in
        Darwin)
            warning "Darwin based environment detected"
        ;;
        Linux)
            if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
                warning "Debian based environment detected"

                [[ ! "$EUID" -ne 0 ]] || sudo apt update
                [[ "$EUID" -ne 0 ]] || apt update

                # install required dependencies
                log "installing packages"

                [[ ! "$EUID" -ne 0 ]] || sudo apt -y install build-essential git debconf locales rbenv curl ruby-build
                [[ "$EUID" -ne 0 ]] || apt -y install build-essential git debconf locales rbenv curl ruby-build

                # generate utf-8 environment
                log "generating locales"

                [[ ! "$EUID" -ne 0 ]] || sudo locale-gen --purge en_US.UTF-8
                [[ "$EUID" -ne 0 ]] || locale-gen --purge en_US.UTF-8

                # updates rbenv cache for installable versions
                [[ -d  "$(rbenv root)"/plugins/ruby-build ]] || git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
            # check if environment is fedora/redhat
            elif [ "$(grep -Ei 'fedora|redhat|centos' /etc/*release)" ]; then
                warning "RedHat based environment detected"

                # install required dependencies
                log "installing packages"

                [[ ! "$EUID" -ne 0 ]] || sudo dnf install @development-tools git -y
                [[ "$EUID" -ne 0 ]] || dnf install @development-tools git -y

                # generate utf-8 environment
                log "generating locales"

                localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
            fi
        ;;
        CYGWIN*|MINGW32*|MSYS*|MINGW*)
            warning "Windows based environment detected"
            error "This is not a supported environment. Exiting."
            exit 1
        ;;
        *)
            error "Unable to detected the environment!"
            error "This is not a supported environment. Exiting."
            exit 1
        ;;
    esac

    # exports the language definitions
    log "exporting locales"
    export LANG="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    export LC_ALL="en_US.UTF-8"

    # tells homebrew to do a silent install
    export CI=1

    # delete previous installations
    log "deleting previous installation of this dotfiles"
    rm -rf ~/.oh-my-zsh/ ~/.zshrc ~/.bash_profile ~/.p10k.zsh

    # copies base bash profile
    log "copying bash profile file"
    cp -rf .bash_profile ~/.bash_profile

    # install the homebrew (if stdin is available requires confirmation)
    log "installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    case "$(uname -s)" in
        Darwin)
            log "installing nerd fonts"

            brew tap homebrew/cask-fonts --quiet

            brew install font-hack-nerd-font
            brew install rbenv
            brew install ruby-build
        ;;
        Linux)
            log "configuring homebrew"

            # enables homebrew on current runtime
            test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
            test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
            test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile

            echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

            log "installing nerd fonts"

            # creates local fonts directory
            mkdir -p ~/.local/share/fonts

            (
                # goes to the directory
                cd ~/.local/share/fonts

                # downloads the font file
                curl -fLo "Hack NF.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

                # reloads font cache
                log "rebuilding fonts"
                fc-cache -f -v
            )
        ;;
        *)
        ;;
    esac

    # Reloads the Environment
    test -d ~/.zshrc && source ~/.zshrc
    test -d ~/.profile && source ~/.profile

    log "installing homebrew packages"

    # installs all the required packages
    brew install bat
    brew install dust
    brew install fish
    brew install fzf
    brew install gh
    brew install git-lfs
    brew install glances
    brew install gnupg
    brew install htop
    brew install less
    brew install nano
    brew install nmap
    brew install nvm
    brew install php
    brew install pstree
    brew install pyenv
    brew install pyenv-virtualenv
    brew install tldr
    brew install thefuck
    brew install wget

    # loads nvm for the first time
    source $(brew --prefix nvm)/nvm.sh

    # sets nvm directory
    export NVM_DIR="$HOME/.nvm"

    # creates nvm directory
    mkdir -p ~/.nvm

    # installs latest node
    log "installing node.js"
    nvm install lts

    # Reloads the Environment
    test -d ~/.zshrc && source ~/.zshrc
    test -d ~/.profile && source ~/.profile

    # switches to latest node
    log "switching to latest node"
    nvm use lts
    nvm alias default lts

    # upgrades npm to latest version
    npm i -g npm --silent

    # configures git lfs
    log "configuring git lfs"
    git lfs install --system

    # updates git configuration
    log "enabling default git strategies"
    git config --global pull.rebase true

    # enable signed commits by default
    log "enabling signed commits"
    git config --global commit.gpgsign true

    # Reloads the Environment
    test -d ~/.zshrc && source ~/.zshrc
    test -d ~/.profile && source ~/.profile

    # removes previous oh-my-zsh
    rm -rf ~/.oh-my-zsh/

    # installs oh-my-zsh
    log "installing oh my zsh"
    ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    log "installing oh my zsh plugins"

    # installs power-level-10k
    ! git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    # installs zsh-syntax-highlighting
    ! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

    # installs zsh-z
    ! git clone https://github.com/agkozak/zsh-z.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z"

    # installs zsh history db
    ! git clone https://github.com/larkery/zsh-histdb.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-histdb"

    # installs zsh auto suggestions
    ! git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

    # installs forgit plugin
    ! git clone https://github.com/wfxr/forgit.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/forgit"

    log "copying environment files"

    # copies the ZSH environment file
    cp .zshrc ~/.zshrc

    # copies the PowerLevel10K configuration file
    cp .p10k.zsh ~/.p10k.zsh

    # touches zsh history file
    [[ ! -f ~/.zsh_history ]] && touch ~/.zsh_history
) >log.log 2>error_log.log

echo "installation Finished. Exiting."

exit 0
