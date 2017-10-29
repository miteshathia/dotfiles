#!/bin/sh

# To execute: save and `chmod +x ./.bootstrap.sh` then `./.bootstrap.sh`

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing xterm-256-color-italic.terminfo..."
curl -O https://raw.githubusercontent.com/nicknisi/dotfiles/master/resources/xterm-256color-italic.terminfo
tic xterm-256color-italic.terminfo
rm xterm-256color-italic.terminfo

echo "Installin yadm..."
brew install yadm

echo "Cloning dotfiles repo..."
yadm clone https://github.com/mathia4/dotfiles.git

echo "Installing vim8..."
brew install vim --with-override-system-vi

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing git..."
brew install git

echo "Installing git-completion.bash..."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $HOME/.git-completion.bash

echo "Installing tmux..."
brew install tmux reattach-to-user-namespace

echo "Installin node and n..."
curl -L https://git.io/n-install | bash -s -- -y
