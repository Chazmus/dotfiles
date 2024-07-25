# Path to your oh-my-zsh installation.

if [ -d $HOME/.config/zsh/ohmyzsh ]; then
  export ZSH=$HOME/.config/zsh/ohmyzsh
elif [ -d $HOME/.oh-my-zsh ]; then
  export ZSH=$HOME/.oh-my-zsh
fi

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
plugins=(git docker colored-man-pages colorize history-substring-search npm bazel zsh-autosuggestions zsh-syntax-highlighting mvn jira)

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

##########################
# Restish
##########################
if type restish > /dev/null; then
  alias restish="noglob restish"
fi

#############
# Functions #
#############
function findfile {
  find . -iname "*$@*"
}

newscript() {
  # Set the default number of lines to 20 if not provided
  num_lines=${1:-20}

  # Get the specified number of entries from bash history, strip line numbers
  history | tail -n $num_lines | awk '{$1=""; print substr($0,2)}' | sed "s/'/'\"'\"'/g" > /tmp/last_commands.txt

  # Create the new Python script
  cat << EOF > newscript.py
#!/usr/bin/env python3
import subprocess

commands = [
EOF

  # Append each command as a list item in the Python script
  while IFS= read -r line; do
    echo "    '$line'," >> newscript.py
  done < /tmp/last_commands.txt

  # Close the list and add the execution code
  cat << 'EOF' >> newscript.py
]

for command in commands:
    print(f"Executing: {command}")
    subprocess.run(command, shell=True)
EOF

  # Remove temporary file
  rm /tmp/last_commands.txt

  # Make the new Python script executable
  chmod +x newscript.py

  echo "newscript.py created and made executable."
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


##################
# zoxide
##################
if type zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
  alias v='f -e vim' # quick opening files with vim
  alias cd="z"
else
  echo "Install zoxide, it's good"
fi

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###################
# User bin folder #
###################
[ -d ~/bin ] && PATH=$PATH:~/bin

# Nix
if [ -e /home/cbailey/.nix-profile/etc/profile.d/nix.sh ]; then . /home/cbailey/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# go
# If directory exists, add to path
if [ -d ~/go/bin ]; then
  export PATH=$PATH:~/go/bin
  export PATH=$PATH:/usr/lib/go/bin
fi

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

########################
# Nicer open
########################

if type xdg-open > /dev/null; then
  alias open='xdg-open'
fi

############
# fzf
############

if type fzf > /dev/null; then
  # eval "$(fzf --zsh)"
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
  if type fd > /dev/null; then
    # -- Use fd instead of find --
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
    # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
      fd --hidden --exclude .git . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type=d --hidden --exclude .git . "$1"
    }
  fi
  export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
  if type eza > /dev/null; then
    export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
    # Advanced customization of fzf options via _fzf_comprun function
    # - The first argument to the function is the name of the command.
    # - You should make sure to pass the rest of the arguments to fzf.
    _fzf_comprun() {
      local command=$1
      shift

      case "$command" in
        cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
      esac
    }
  fi
  # theme
  export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
fi

if type eza > /dev/null; then
  alias ls="eza --icons=always --all"
fi


############
# The fuck
############
if type fuck > /dev/null; then
  eval $(thefuck --alias)
fi


############
# bat
############

if type bat > /dev/null; then
  export BAT_THEME="Dracula"
fi


############
# copilot
############

if type gh > /dev/null; then
  alias ghcs="gh copilot suggest"
  alias ghce="gh copilot explain"
fi

############
# git-fzf.sh
############

if [ -d ~/tools/fzf-git.sh ]; then
  source ~/tools/fzf-git.sh/fzf-git.sh
fi

########
# Atuin
########
if type atuin > /dev/null; then
  eval "$(atuin init zsh)"
fi


############
# Aliases #
###########
alias wow="git status"
alias mci="mvn clean install"
alias weather="curl -s wttr.in"
if type lazygit > /dev/null; then
  alias lg="lazygit"
fi
if type lazydocker > /dev/null; then
  alias lad="lazydocker"
fi


#######################
# Load env settings   #
#######################
if [ -f $HOME/.zsh_env ]; then
  source $HOME/.zsh_env
fi

if [ -f $HOME/.bash_env ]; then
  source $HOME/.bash_env
fi
if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source /usr/share/nvm/init-nvm.sh
fi
