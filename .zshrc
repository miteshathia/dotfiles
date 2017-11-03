# ========================================
# GENERAL SETTINGS
# ========================================

# Adds tab completion for git
if [ -f $HOME/.git-completion.zsh ]; then
    . $HOME/.git-completion.zsh
fi

# Vim keybindings in bash
set -o vi

# Aliases
alias weather="curl wttr.in"
