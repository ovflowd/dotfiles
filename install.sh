#!/usr/bin/env zsh

echo "\e[31m\n\n !! WARNING: This script will overwrite existing ZSH, Bash Profile and Oh-My-ZSH configurations !! \n"

# check if environment is debian/ubuntu
if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
    echo "\e[32m[DOT]\e[34m debian based environment detected ... \n"
    # install required dependencies 
    echo "\e[32m[DOT]\e[34m installing packages ... \n"
    sudo apt -y install build-essential git debconf locales fonts-hack-ttf > /dev/null 2>&1
    # generate utf-8 environment
    echo "\e[32m[DOT]\e[34m generating locales ... \n"
    sudo locale-gen --purge en_US.UTF-8 > /dev/null 2>&1
    # reloads font cache
    echo "\e[32m[DOT]\e[34m rebuilding fonts ... \n"
    fc-cache -f -v > /dev/null 2>&1
# check if environment is fedora/redhat
elif [ "$(grep -Ei 'fedora|redhat|centos' /etc/*release)" ]; then
    echo "\e[32m[DOT]\e[34m redhat based environment detected ... \n"
    # install required dependencies
    echo "\e[32m[DOT]\e[34m installing packages ... \n"
    sudo dnf copr enable zawertun/hack-fonts -y > /dev/null 2>&1
    # install font packages
    sudo dnf install hack-fonts @development-tools git -y > /dev/null 2>&1
    # generate utf-8 environment
    echo "\e[32m[DOT]\e[34m generating locales ... \n"
    localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 > /dev/null 2>&1
    # reloads font cache
    echo "\e[32m[DOT]\e[34m rebuilding fonts ... \n"
    fc-cache -f -v > /dev/null 2>&1
# check if environment is macOS
elif [ "$(uname)" == "Darwin" ]; then
    echo "\e[32m[DOT]\e[34m macOS environment detected ... \n"
    echo "\e[32m[DOT]\e[34m Hack Nerd Fonts requires manual installation.. Download it from: https://github.com/source-foundry/Hack/releases/"
else
    echo "\e[32m[DOT]\e[31m your running OS was not recognised. Exiting. \e[39m\n"
    exit 1
fi

# exports the language definitions
echo "\e[32m[DOT]\e[34m exporting locales ... \n"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# tells homebrew to do a silent install
export CI=1

# delete previous installations
echo "\e[32m[DOT]\e[34m deleting previous installation of this dotfiles ... \n"
rm -rf ~/.oh-my-zsh/ ~/.zshrc ~/.bash_profile ~/.p10k.zsh > /dev/null 2>&1

# copies base bash profile
echo "\e[32m[DOT]\e[34m copying bash profile file ... \n"
cp -rf .bash_profile ~/.bash_profile > /dev/null 2>&1

# install the homebrew (if stdin is available requires confirmation)
echo "\e[32m[DOT]\e[34m installing homebrew ... \n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" > /dev/null 2>&1

# installs homebrew on the environment
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/codespace/.profile

# enables homebrew on current runtime
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

echo "\e[32m[DOT]\e[34m installing homebrew packages ... \n"

# taps to a homebrew tap for mcfly package
brew tap cantino/mcfly https://github.com/cantino/mcfly > /dev/null 2>&1

# installs all the required packages
brew install bat glances mcfly thefuck git-lfs gcc nano htop nano wget nmap gnupg > /dev/null 2>&1

# configures git lfs
echo "\e[32m[DOT]\e[34m configuring git lfs ... \n"
git lfs install --system > /dev/null 2>&1

# installs oh-my-zsh
echo "\e[32m[DOT]\e[34m installing oh my zsh ... \n"
! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1

echo "\e[32m[DOT]\e[34m installing oh my zsh plugins ... \n"

# installs power-level-10k
! git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" > /dev/null 2>&1

# installs zsh auto suggestions
! git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" > /dev/null 2>&1

# installs zsh-syntax-highlighting
! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" > /dev/null 2>&1

# installs zsh-z
! git clone https://github.com/agkozak/zsh-z.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z" > /dev/null 2>&1

# copies the ZSH environment file
cp -rf .zshrc ~/.zshrc

# copies the PowerLevel10K configuration file
cp -rf .p10k.zsh ~/.p10k.zsh

echo "\e[32m installation finished. exiting. \e[39m\n"

exit 0