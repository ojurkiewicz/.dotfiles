export PATH=~/.npm-global/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export FPATH=~/.zfunc:$FPATH

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

eval "$(starship init zsh)"

alias ls="exa"
alias cat="bat"
alias tt="~/tmux-sessionizer"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias lg="lazygit"

gch() {
 git checkout $(git branch | fzf) && git fetch
}

# Save command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oktawian.jurkiewicz/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oktawian.jurkiewicz/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oktawian.jurkiewicz/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oktawian.jurkiewicz/google-cloud-sdk/completion.zsh.inc'; fi

gch() {
  git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout
}

_fzf_complete_kubectx() {
  _fzf_complete --reverse --prompt="context name> " -- "$@" < <(
    kubectl config get-contexts -o name
  )
}

kubectx() {
  kubectl config use-context $1
}

_fzf_complete_kubex() {
  _fzf_complete --reverse --prompt="pod name> " -- "$@" < <(
    kubectl get deploy -o json | jq '.items[] as $item | $item.spec.template.spec.containers[] as $c | "deploy/" + $item.metadata.name + " -c " + $c.name' | tr -d \"
  )
}


kubex() {
  kubectl exec -it ${@:1}
}
export MAGICK_HOME=/opt/homebrew/opt/imagemagick/
export PATH="/opt/homebrew/opt/imagemagick/bin:$PATH"
