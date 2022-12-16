# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/$USER/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Apps 
brew install stow
brew install neovim
brew install tmux
brew install fzf
brew install starship
brew install exa
brew install bat
brew install lua-language-server
brew install lua
brew install n
brew install glib
