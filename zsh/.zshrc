#PS1="%{%F{033}%}%n%{%f%}@%{%F{green}%}%m:%{%F{yellow}%}%~%{$%f%}%  "
PS1="%F{033}%n%f:%F{cyan}%~%f"$'\n'"-> "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

ZSH_THEME="minimal"

# Kubectl auto completion
#source <(kubectl completion zsh)

#GO111MODULE
export GO111MODULE=on 
#export GOPRIVATE='brank.as/*'

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
alias gojek="cd ~/Workspace"
alias transport="cd ~/Workspace/transport"
alias dotfile="~/workspace/dotfiles"
alias bash="/usr/local/bin/bash"
alias nvim-lua="cd ~/.config/nvim/lua/nkristianto"

# gcloud
alias gcl="gcloud"
#alias gcnovian="gcl auth login noviankristianto@gmail.com"
#alias gcbrankas="gcl auth login novian.kristianto@brank.as"
alias gclproject="gcl projects list"
alias gcsproject="gcl config set project"

# kubectl alias
alias kc="kubectl"
alias kcgc="kc config get-contexts"
alias kcc="kc config current-context"
alias kcsc="kc config use-context"
alias kctx="kubectx"

# g-go version manager
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/novian.kristianto/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/novian.kristianto/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/novian.kristianto/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/novian.kristianto/Desktop/google-cloud-sdk/completion.zsh.inc'; fi
