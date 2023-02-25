# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GPG_TTY=$(tty)

# Preferred editor for local and remote sessions
export EDITOR='nano'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to PyEnv Installation
export PYENV_ROOT="$HOME/.pyenv"

# Updated Path Exports
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"

# Export NVM Installation
export NVM_DIR="$HOME/.nvm"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# History DB command for tabulation
HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')

# Defines History DB auto completion command
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="
		select commands.argv from
		history left join commands on history.command_id = commands.rowid
		left join places on history.place_id = places.rowid
		where places.dir LIKE '$(sql_escape $PWD)%'
		and commands.argv LIKE '$(sql_escape $1)%'
		group by commands.argv order by count(*) desc limit 1
	"

    suggestion=$(_histdb_query "$query")
}

# Sets ZSH Auto Suggestion to use HistDB
ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	cp
	colorize
	web-search
	node
	npm
	zsh-z
	zsh-autosuggestions
)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Loads Homebrew (only if exists and needed (Linux))
[[ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]] || eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
[[ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]] || export BYOBU_PREFIX=/home/linuxbrew/.linuxbrew

# Load Oh My ZSH
source $ZSH/oh-my-zsh.sh

# Load History DB
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh

# Load Forgit
source $HOME/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh

# Loads NVM
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Loads The-Fuck
eval $(thefuck --alias f)

# Adds RBENV to Shell
eval "$(rbenv init - zsh)"

# PyEnv VirtualEnv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias up="cd .."
alias cl="clear"
alias g="git"
alias commit="git cz"
alias bu="brew upgrade"

# Updates the `bu` alias to upgrade casks too when on macOS
[[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] || alias bu="brew upgrade --casks"

# Prints a Larry3D text with your "Hey, {whoami}"
figlet -w 200-k -f "$(brew --prefix)/share/figlet/fonts/larry3d.flf" "$(printf '%.0s ' {0..5})Hey,"
figlet -w 200 -k -f "$(brew --prefix)/share/figlet/fonts/larry3d.flf" "$(printf '%.0s ' {0..5})$(whoami)"

# Prints a random motivation phrase
echo "\n\n$(printf '%.0s ' {0..20})$(motivate)\n"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
