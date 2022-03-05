eval "$(starship init zsh)"

alias bat="batcat"
alias mysz="bluetoothctl power off && bluetoothctl power on"
alias cat="bat"
alias ls="exa"

# Set up Node Version Manager
#source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
