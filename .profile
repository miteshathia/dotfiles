# ========================================
# GENERAL SETTINGS
# ========================================

# Command line tools for Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Android SDK configuration
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Yarn package manager
export PATH=$PATH:`yarn global bin`

# Adds escape sequences for italics
export TERM=xterm-256color-italic
