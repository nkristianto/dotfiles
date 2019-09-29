# aliasing
alias dps="sudo docker ps"
alias dim="sudo docker images"
alias dipr="sudo docker image prune"
alias dcpr="sudo docker container prune"
alias ggo="$GOPATH/bin/g"
alias vim="nvim"
alias vi="nvim"
alias eb="vi ~/.bashrc"
alias eba="vi ~/.bash_aliases"
alias sb="source ~/.bashrc"
alias ev="vim ~/.config/nvim/init.vim"
alias eg="vim ~/.gitconfig"
alias dotfile="cd ~/workspace/dotfiles"
alias brankas="cd ~/go/src/brank.as"

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

# ------------------------------------------------------------
# kubectl
if [ ! -z "$(which kubectl)" ]; then
  alias kc='kubectl'
  source <(kubectl completion bash)
  complete -o default -F __start_kubectl kc
fi
# ------------------------------------------------------------
