#!/bin/bash

brew update
brew upgrade

brew tap homebrew/versions
brew tap phinze/homebrew-cask
brew tap homebrew/binary
brew tap thoughtbot/formulae
brew tap caskroom/versions
brew tap peco/peco

# パッケージのインストール
brew install subversion
brew install zsh

# editor
brew install vim

## Git
brew install git
brew install hub
brew install gitsh
brew install gist
brew install tig
brew install gibo
brew install ghq

## Utils
brew install wget
brew install curl
brew install tree
brew install openssl
brew install libyaml
brew install readline
brew install tmux
brew install markdown
brew install nkf
brew install ag
brew install peco
brew install mas

# for tmux etc
brew install reattach-to-user-namespace

# plugin mamagers
brew install zplug
brew install nodebrew

# db
brew install mongo

## Image
brew install imagemagick

# Casks
brew install brew-cask

# brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install dropbox
brew cask install sourcetree
# brew cask install kobito
# brew cask install atom
brew cask install cyberduck
# brew cask install shiftit

#quicklook plugin
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webp-quicklook
brew cask install suspicious-package
brew cask install macdown

# link
#brew cask alfred link # brew-caskのappをalfredで探せるようにする
# Remove outdated versions
brew cleanup
