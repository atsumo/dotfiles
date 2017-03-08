#homebrewを最新版にアップデート
update || true

# Formulaを更新
upgrade || true

# Add Repository
tap homebrew/versions    || true
tap phinze/homebrew-cask || true
tap homebrew/binary      || true
tap thoughtbot/formulae  || true
tap caskroom/versions    || true
tap peco/peco            || true

# パッケージのインストール
install subversion || true

# editor
install vim   || true

## Git
install git   || true
install hub   || true
install gitsh || true
install gist  || true
install tig   || true
install gibo  || true

## Utils
install wget      || true
install curl      || true
install tree      || true
install openssl   || true
install libyaml   || true
install readline  || true
install tmux      || true
install markdown  || true
install nkf       || true
install ag        || true
install peco      || true

##
#install erlang    || true

## Image
install imagemagick || true

# Casks
install brew-cask
cask install google-chrome || true
cask install google-japanese-ime || true
cask install iterm2        || true
cask install dropbox       || true
#cask install hipchat       || true
#cask install alfred        || true
cask install sourcetree    || true
cask install evernote      || true
cask install kobito        || true
#cask install sublime-text3  || true
#cask install keepassx      || true
cask install virtualbox    || true
cask install vagrant       || true
#cask install kitematic      || true
cask install cyberduck     || true
cask install clipmenu      || true

#quicklook plugin
cask install qlcolorcode  || true
cask install qlstephen    || true
cask install qlmarkdown   || true
cask install quicklook-json   || true
cask install qlprettypatch  || true
cask install quicklook-csv  || true
cask install betterzipql    || true
cask install webp-quicklook || true
cask install suspicious-package || true
cask install macdown  || true
# link
#cask alfred link # brew-caskのappをalfredで探せるようにする
# Remove outdated versions
cleanup