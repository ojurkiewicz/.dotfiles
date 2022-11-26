export PATH=~/.npm-global/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

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

