#export TERM="xterm-256color"
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/go
export GPC=$HOME/workspace/google-cloud-sdk
export GRPC_CLI="/Users/noviankristianto/workspace/grpc/bins/opt"
export PATH=$GOROOT/bin:$GOPATH/bin:$GCP/bin:$GRPC_CLI:$PATH
export LIBRARY_PATH=$LIBRARY_PATH:~/workspace/tesorflow/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:~/workspace/tesorflow/lib
export CHROME="/Applications/Google Chrome.app/Contents/MacOS"
export PATH=$CHROME:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/noviankristianto/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="minimal"
#ZSH_THEME="powerlevel9k/powerlevel9k"

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noviankristianto/workspace/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noviankristianto/workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noviankristianto/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noviankristianto/workspace/google-cloud-sdk/completion.zsh.inc'; fi

precmd() { print "" }

# Kubectl auto completion
source <(kubectl completion zsh)

#GO111MODULE
export GO111MODULE=on 
export GOPRIVATE='brank.as/*'

# aliasing
alias dps="docker ps"
alias dim="docker images"
alias dipr="docker image prune"
alias dcpr="docker container prune"
alias ggo="$GOPATH/bin/g"
alias vim="nvim"
alias vi="nvim"
alias ez="vi ~/.zshrc"
alias sz="source ~/.zshrc"
alias ev="vim ~/.config/nvim/init.vim"
alias et="vim ~/.tmux.conf"
alias eg="vim ~/.gitconfig"
alias workdir="~/workspace/golang/github.com/nkristianto"
alias workdir-chelvins="~/workspace/chelvins/github.com"
alias dotfile="~/workspace/dotfiles"
alias brankas="~/go/src/brank.as"
alias bash="/usr/local/bin/bash"

# gcloud
alias gcl="gcloud"
alias gcnovian="gcl auth login noviankristianto@gmail.com"
alias gcbrankas="gcl auth login novian.kristianto@brank.as"
alias gclproject="gcl projects list"
alias gcsproject="gcl config set project"

# kubectl alias
alias kc="kubectl"
alias kcgc="kc config get-contexts"
alias kcc="kc config current-context"
alias kcsc="kc config use-context"

# g-go version manager
export GOPATH="$HOME/go"; export GOROOT="/usr/local/opt/go/libexec"; PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
