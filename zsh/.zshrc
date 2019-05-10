# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="/Users/novian/go/bin:$PATH

export TERM="xterm-256color"
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/go
export GPC=$HOME/workspace/google-cloud-sdk
export PATH=$GOROOT/bin:$GOPATH/bin:$GCP/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/noviankristianto/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3


# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noviankristianto/workspace/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noviankristianto/workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noviankristianto/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noviankristianto/workspace/google-cloud-sdk/completion.zsh.inc'; fi



# aliasing
alias ez="vi ~/.zshrc"
alias sz="source ~/.zshrc"
alias dps="docker ps -a"
alias dim="docker images"
alias dipr="docker image prune"
alias dcpr="docker container prune"
alias ggo="$GOPATH/bin/g"
alias gb="go build"
alias gbr="go build -race"
alias vim="nvim"
alias vi="nvim"
alias ev="vim ~/.config/nvim/init.vim"
alias et="vim ~/.tmux.conf"
alias workdir="/Users/noviankristianto/workspace/golang/github.com/nkristianto"
# g-go version manager
export GOPATH="$HOME/go"; export GOROOT="/usr/local/opt/go/libexec"; PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
