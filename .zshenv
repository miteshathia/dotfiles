# ========================================
# GENERAL SETTINGS
# ========================================

# Adds escape sequences for italics
export TERM=xterm-256color-italic

# n Node version management (added by n-install)
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
