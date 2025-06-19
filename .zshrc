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

# Aliases
alias cd="z"
alias dc="docker compose"
alias cat="bat"
alias rot13="tr 'A-Zaa-z' 'N-ZA-Mn-za-m'"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log"
alias gb="git branch"
alias gd="git diff"
alias gs="git status"
alias gap="git add --patch"
alias glo="git log --oneline"
alias gcan="git commit --amend --no-edit"
alias git-tree="git log --graph --oneline --all --decorate"

# Appearance
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
