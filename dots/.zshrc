# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/zsh/ohmyzsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="ys"
#ZSH_THEME="afowler"
#ZSH_THEME="tjkirch"
#ZSH_THEME="babun"

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
ENABLE_CORRECTION="false"
# CORRECT_IGNORE="[_|.]*"

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

# Load up TMUX
# if [ -z "$TMUX" ]
# then
#     tmux
# fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(git docker colored-man-pages colorize history-substring-search npm bazel zsh-autosuggestions zsh-syntax-highlighting mvn)

source $ZSH/oh-my-zsh.sh

##########################
# Vim editor best editor #
##########################
export EDITOR='vim'
# vim powers at the command line
set -o vi

# Actually, neovim editor best editor
if type nvim > /dev/null; then
    alias vim="nvim"
fi

#############
# Functions #
#############
function findfile {
    find . -iname "*$@*"
}

function newscript {
    history | tail -20 |cut -c 8- > newscript.sh;  chmod 777 newscript.sh; sed -i '1 i\#!/usr/bin/bash' newscript.sh
}

###################
# Words of wisdom #
###################
if type fortune > /dev/null && type cowsay > /dev/null && type lolcat > /dev/null; then
    fortune|cowsay|lolcat --spread 1
fi

################
# Some tools   #
################
# Jenv
if type jenv > /dev/null; then
    export PATH=$HOME/.jenv/shims:$PATH
    export PATH=$HOME/.jenv/bin:$PATH
    eval "$(jenv init -)"
fi
if type pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi


if type fasd > /dev/null; then
    eval "$(fasd --init auto)"
    alias v='f -e vim' # quick opening files with vim
else
    echo "Install fasd, it's good"
fi

# if type trash-put > /dev/null; then
#    alias rm='trash-put'
# fi

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###################
# User bin folder #
###################
[ -d ~/bin ] && PATH=$PATH:~/bin

# Nix
if [ -e /home/cbailey/.nix-profile/etc/profile.d/nix.sh ]; then . /home/cbailey/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

##################
# Copy paste cli #
##################

if type xclip > /dev/null; then
    # for x based linux wms
    alias copy='xclip -selection clipboard'
    alias paste='xclip -selection clipboard -o'
elif type pbcopy > /dev/null; then
    # for mac
    alias copy='pbcopy'
    alias paste='pbpaste'
elif type wl-copy > /dev/null; then
    # for wayland based linux wms
    alias copy='wl-copy'
    alias paste='wl-paste'
fi

############
# Aliases #
###########
alias wow="git status"
alias mci="mvn clean install"
alias weather="curl -s wttr.in"


#######################
# Load env settings   #
#######################
if [ -f $HOME/.zsh_env ]; then
    source $HOME/.zsh_env
fi

if [ -f $HOME/.bash_env ]; then
    source $HOME/.bash_env
fi
