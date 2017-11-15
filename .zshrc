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
# zplug "subnixr/minimal"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load


ICO_DIRTY="*"
ICO_AHEAD="↑"
ICO_BEHIND="↓"
ICO_DIVERGED="⥮"
COLOR_ROOT="%F{red}"
COLOR_USER="%F{green}"
COLOR_NORMAL="%F{white}"

#█▓▒░ allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

#█▓▒░ colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="${COLOR_USER}"
else # root!
	USER_LEVEL="${COLOR_ROOT}"
fi

#█▓▒░ git prompt
GIT_PROMPT() {
  test=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! "$test" ]; then
    echo "$reset_color%F{green}▒░"
    return
  fi
  ref=$(git name-rev --name-only HEAD | sed 's!remotes/!!' 2> /dev/null)
  dirty="" && [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && dirty=$ICO_DIRTY
  stat=$(git status | sed -n 2p)
  case "$stat" in
    *ahead*)
      stat=$ICO_AHEAD
    ;;
    *behind*)
      stat=$ICO_BEHIND
    ;;
    *diverged*)
      stat=$ICO_DIVERGED
    ;;
    *)
      stat=""
    ;;
  esac

  echo "%{$bg[magenta]%}%F{green}▓▒░ %F{black}${ref}${dirty}${stat} $reset_color%F{magenta}▒░"
}

PROMPT='%{$bg[green]%} %F{black}%~ $(GIT_PROMPT)$reset_color %f'
