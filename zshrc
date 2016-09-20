# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="ys"
#ZSH_THEME="afowler"
#ZSH_THEME="tjkirch"
ZSH_THEME="babun"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mvn bash docker vagrant gem web-search colored-man-pages colorize history-substring-search npm zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#########################
# Environment Variables #
#########################

export GIT_HOME=~/workspace

#############
# Functions #
#############

function findfile {
    find . -iname "*$@*"
}

###################
# Words of wisdom #
###################
# fortune|cowsay|lolcat --spread 1

################
# User defined #
################
if type fuck > /dev/null; then
    eval $(thefuck --alias)
fi

if type autojump > /dev/null; then
    . /usr/share/autojump/autojump.sh
fi

############
# Aliases #
###########
alias vi=vim
alias wow="git status"
alias wp="cd ~/workspace"
alias aardwolf="telnet aardmud.org 23"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias sshconfig="vim ~/.ssh/config"
alias xclip="xclip -selection c"
alias mci="mvn clean install"
alias aptsearch="apt-cache search"
alias aptinstall="sudo apt-get install"
alias docs="cd /home/chaz/Documents/"

alias collections="cd ~/workspace/collections"
alias wayb="cd ~/workspace/WAYB"
alias ayb="cd ~/workspace/AYB"
alias music="cd ~/workspace/music-express"
alias churchillcentral="cd ~/workspace/churchill-central"
alias churchillarchive="cd ~/workspace/churchill-archive"
alias dpp="cd ~/workspace/dpp"
alias rep="cd ~/workspace/routledge-encyclopedia-of-philosophy"
alias rpa="cd ~/workspace/routledge-performance-archive"
alias fashion="cd ~/workspace/fashion-central"

alias ...="cd ../.."
