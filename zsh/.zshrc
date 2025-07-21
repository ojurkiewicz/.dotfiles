export LANG="en_US.UTF-8"
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

if [[ -f $HOME/secrets ]]; then
  . $HOME/secrets
fi

eval "$(starship init zsh)"

export VISUAL=nvim
export EDITOR="$VISUAL"

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
export PATH="/usr/local/texlive/2021basic/bin/x86_64-darwin:$PATH"

fpath=(/usr/local/share/zsh/site-functions $fpath)

export GPG_TTY=$(tty)

# Automatically activate Python virtual environments in the directory
function workon_cwd {
    if [ ! -d venv ]; then
        deactivate 2>/dev/null || true
        return
    elif [ -f venv/bin/activate ]; then
        source venv/bin/activate
    fi
}

# Check the active directory whenever you navigate around
add-zsh-hook chpwd workon_cwd


bindkey '^P' up-history
bindkey '^N' down-history


# pnpm
export PNPM_HOME="/Users/oktawian.jurkiewicz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
setopt extendedglob
export PATH="/opt/homebrew/opt/go@1.21/bin:$PATH"
set -o emacs

alias python_homebrew='/opt/homebrew/bin/python3.11'

# Initialize when shell starts 
workon_cwd

[[ -s "/Users/oktawian.jurkiewicz/.gvm/scripts/gvm" ]] && source "/Users/oktawian.jurkiewicz/.gvm/scripts/gvm"

# Add Poetry to PATH
export PATH="$HOME/Library/Application\ Support/pypoetry/venv/bin:$PATH"
