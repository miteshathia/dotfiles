# ========================================
# GENERAL SETTINGS
# ========================================

# Yarn package manager
# export PATH=$PATH:`yarn global bin`

# Adds escape sequences for italics
export TERM=xterm-256color-italic

# n Node version management
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
