# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
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
plugins=(git docker colored-man-pages colorize history-substring-search npm bazel zsh-autosuggestions zsh-syntax-highlighting bazel mvn)

source $ZSH/oh-my-zsh.sh

#####################
# User configuration#
#####################

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'


###########################
# Temper
###########################
export PATH="/Users/${USER}/Library/Python/3.9/bin:${PATH}"
# Enable bash completions
autoload -Uz bashcompinit && bashcompinit
# # Register temper for auto-completion
eval "$(register-python-argcomplete temper)"

###################################
# ForgeOps - Deploying CDK on GKE
###################################
export GCP_PROJECT_ID=engineering-devops
export GKE_CLUSTER_NAME=eng-shared-1
export GKE_CLUSTER_REGION=us-east1
export GKE_CONTEXT=gke_${GCP_PROJECT_ID}_${GKE_CLUSTER_REGION}_${GKE_CLUSTER_NAME}
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
export GKE_NAMESPACE=cbailey

#########################
# Jenv
#########################
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

########################
# Deploying AM locally #
########################
export MAVEN_OPTS='-Xmx8g -Xms2g'
export PATH="/usr/local/opt/tomcat@8/bin:$PATH"

export TOMCAT_WEBAPP_DIR="/usr/local/Cellar/tomcat@8/8.5.72/libexec/webapps"

########################
# User path folder
########################
export PATH="/Users/${USER}/bin:${PATH}"
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

############
# Aliases #
###########
alias wow="git status"
alias mci="mvn clean install"
alias mciFast="mvn clean install -DskipTests -DskipITs -Dmaven.test.skip -T1C -P\!XUI"
alias mciVFast="mvn --threads 0.5C --projects openam-server --also-make --define pmd.skip=true --define maven.test.skip=true --define skipTests=true --activate-profiles \!xui install"
alias mciDocker="mvn clean install -DskipTests -DskipITs -Dmaven.test.skip -T1C -P\!XUI,docker,descriptor"
alias weather="curl -s wttr.in"
alias save-script="history | tail -20 |cut -c 8- > newscript.sh;  chmod 777 newscript.sh; sed '1 i #!/bin/bash' newscript.sh"

####################
# Custom Functions
# ##################

temperClass() {
    # Run temper functional test on a given class
    temper functional-tests --deploy 7.2.0-SNAPSHOT --with-timetravel --hostname openam.localtest.me --only-classes=$1
}

eval "$(export _AMMAN_COMPLETE=source_zsh; amman)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
