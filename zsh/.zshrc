export PATH=~/.npm-global/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

eval "$(starship init zsh)"

alias ls="exa"
alias cat="bat"
alias tt="~/tmux-sessionizer"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

gch() {
 git checkout $(git branch -r | fzf)
}

# Save command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
