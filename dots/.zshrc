
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
ENABLE_CORRECTION="true"
CORRECT_IGNORE="[_|.]*"

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

# Auto start tmux
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(git docker colored-man-pages colorize history-substring-search npm bazel zsh-autosuggestions zsh-syntax-highlighting bazel mvn)

source $ZSH/oh-my-zsh.sh

#####################
# User configuration#
#####################
export EDITOR='vim'

#############
# Functions #
#############
function findfile {
    find . -iname "*$@*"
}

###################
# Words of wisdom #
###################
if type fortune > /dev/null && type cowsay > /dev/null && type lolcat > /dev/null; then
    fortune|cowsay|lolcat --spread 1
fi

if [ -f $HOME/.bashrc_env ]; then
    source $HOME/.bashrc_env
fi


if [ -f $HOME/.zshrc_env ]; then
    source $HOME/.zshrc_env
fi

################
# User defined #
################
if type fuck > /dev/null; then
    eval $(thefuck --alias)
fi

if type autojump > /dev/null; then
    . /usr/share/autojump/autojump.zsh
fi

if type fasd > /dev/null; then
    eval "$(fasd --init auto)"
fi

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

############
# Aliases #
###########
alias wow="git status"
alias mci="mvn clean install"
alias weather="curl -s wttr.in"
