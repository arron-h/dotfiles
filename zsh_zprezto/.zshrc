#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load local rc files
if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi

# Customize to your needs...
if command -v archey >/dev/null 2>&1; then
  archey
fi
