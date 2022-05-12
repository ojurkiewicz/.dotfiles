export PATH=~/.npm-global/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

eval "$(starship init zsh)"

alias ls="exa"
alias cat="bat"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
