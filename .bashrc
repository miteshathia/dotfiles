# ========================================
# GENERAL SETTINGS
# ========================================

# Adds tab completion for git
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Vim keybindings in bash
set -o vi

# Simple PS1 with git branch and colors
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="[\u]\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "

# Aliases
alias weather="curl wttr.in"
