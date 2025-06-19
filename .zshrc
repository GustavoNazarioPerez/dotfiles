# Homebrew Setup
export HOMEBREW_PREFIX="/opt/homebrew"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"

# Add autocompletion to zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up Starship
eval "$(starship init zsh)"

# fzf keybindings
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# Appearance
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
