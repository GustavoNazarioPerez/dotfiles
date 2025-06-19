#!/bin/bash

# Dotfiles installation script
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_step() {
    echo -e "${BLUE}==> $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS"
    exit 1
fi

print_step "Starting dotfiles installation..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    print_step "Install homebrew and add it to PATH before running this script"
else
    print_success "Homebrew already installed"
fi

# Update Homebrew
print_step "Updating Homebrew..."
brew update

# Install essential CLI tools
print_step "Installing CLI tools..."
brew_packages=(
    # Shell & Terminal
    "starship"
    "fzf"
    "zoxide"

    # Git tools
    "git"
    "gh"
    "git-delta"

    # Modern CLI replacements
    "bat"          # better cat
    "ripgrep"      # better grep
    "fd"           # better find
    "htop"         # better top

    # Utilities
    "wget"
    "curl"
    "jq"
    "tree"
    "watch"
    "unzip"
)

for package in "${brew_packages[@]}"; do
    if brew list "$package" &>/dev/null; then
        print_success "$package already installed"
    else
        print_step "Installing $package..."
        brew install "$package"
        print_success "$package installed"
    fi
done

# Install Zsh plugins
print_step "Installing Zsh plugins..."
brew install zsh-autosuggestions zsh-syntax-highlighting

# Neovim setup
print_step "Setting up Neovim..."

# Install Neovim
if ! command -v nvim &> /dev/null; then
    brew install neovim
    print_success "Neovim installed"
fi

# Install plugins (this will run your plugins.lua)
print_step "Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa

# Define fonts to install
print_step "Installing fonts..."
font_packages=(
    "font-fira-code"
    "font-sf-mono-nerd-font-ligaturized"
)

# Install fonts
for font in "${font_packages[@]}"; do
    if brew list --cask "$font" &>/dev/null; then
        print_success "$font already installed"
    else
        print_step "Installing $font..."
        if brew install --cask "$font"; then
            print_success "$font installed successfully"
        else
            print_error "Failed to install $font"
        fi
    fi
done

# Verify installations
print_step "Verifying font installations..."

# Check using fc-list (if available)
if command -v fc-list &> /dev/null; then
    echo
    echo "Checking installed fonts:"

    if fc-list | grep -qi "fira.*code"; then
        print_success "Fira Code detected in system fonts"
    else
        print_warning "Fira Code not detected (may need system restart)"
    fi
    
    if fc-list | grep -qi "sf.*mono.*nerd"; then
        print_success "SF Mono Nerd Font detected in system fonts"
    else
        print_warning "SF Mono Nerd Font not detected (may need system restart)"
    fi
else
    print_warning "fc-list not available, skipping font verification"
fi

# Final setup
print_step "Running final setup..."
brew cleanup
brew doctor || true

print_success "✨ Dotfiles installation complete!"
print_warning "Restart your terminal or run 'source ~/.zshrc' to apply changes"
print_warning "Some applications may require manual configuration"

echo
echo "Next steps:"
echo "1. Restart your terminal"
echo "2. Setup symlinks"
echo "3. Review and customize your dotfiles as needed"
