#!/usr/bin/env zsh

sudo apt -y install nano build-essential git python3-dev gcc debconf locales fonts-hack-ttf htop wget nmap node wget

sudo locale-gen --purge en_US.UTF-8

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

rm -rf ~/.oh-my-zsh/

rm -rf ~/.zshrc ~/.bash_profile ~/.p10k.zsh

cp -rf .bash_profile ~/.bash_profile

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/codespace/.profile

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

source ~/.profile

brew tap cantino/mcfly https://github.com/cantino/mcfly

brew install bat glances mcfly thefuck

! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

! git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

! git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

! git clone https://github.com/agkozak/zsh-z.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z"

cp -rf .zshrc ~/.zshrc

cp -rf .p10k.zsh ~/.p10k.zsh

fc-cache -f -v