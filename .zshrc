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

# ========================================
# PLUGINS
# ========================================

. ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
