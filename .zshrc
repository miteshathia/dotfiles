# ========================================
# GENERAL CONFIG
# ========================================

# Adds tab completion for git
if [ -f $HOME/.git-completion.zsh ]; then
  . $HOME/.git-completion.zsh
fi

# Vim keybindings in bash
set -o vi

# Aliases
alias weather="curl wttr.in"
alias vim="nvim"

# Start rbenv
eval "$(rbenv init -)"

# Magic enter
MAGIC_ENTER_MARGIN=" "

function magic_base {
  printf "└── "
  dirs
  echo ""
  git -c color.status=always status -sb 2> /dev/null
}

function wrap_output {
  local output="$1"
  local output_len="$(echo "$output" | sed -n '$=')"
  if [ -n "$output" ]; then
    if [ "$output_len" -gt "$((LINES - 2))" -a -n "$PAGER" ]; then
      printf "$output\n" | "$PAGER" -R
    else
      printf "$output\n" | sed "s/^/$MAGIC_ENTER_MARGIN/"
    fi
  fi
}

function magic_enter {
  if [ -z $BUFFER ]; then
    echo ""
    wrap_output "$(magic_base)"
    zle redisplay
  else
    zle accept-line
  fi
}

zle -N magic_enter
bindkey "^M" magic_enter


# ========================================
# PROMPT
# ========================================

ICO_DIRTY="*"
ICO_AHEAD="↑"
ICO_BEHIND="↓"
ICO_DIVERGED="⥮"

# Allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

# Git prompt
function fg_color {
  local is_git_repo=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ ! "$is_git_repo" ]; then
    echo 007 # bright white
  else
    if ! git diff-files --quiet; then
      echo 009 # bright red
    elif ! git diff-index --quiet --cached $(git write-tree) --; then
      echo 011 # bright yellow
    else
      echo 010 # bright green
    fi
  fi
}

PROMPT='%F{$(fg_color)} $ %f%k'


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
