# ========================================
# GENERAL SETTINGS
# ========================================

# Adds escape sequences for italics
export TERM=xterm-256color-italic

# n Node version management (added by n-install)
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
# PostgreSQL CLI
PATH+=":/Applications/Postgres.app/Contents/Versions/latest/bin"

# Personal access token for DO
export DO_TOKEN=b02820fc538f2b68b45c79af8141de698e879e5666f8b3c78de35bb3fa5f283b
