# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
#####################################
# plugins
#####################################
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugin define
zplug "zplug/zplug"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'

# powerline
# source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# 必要ならばアーキテクチャ指定
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
# # fzf-tmux の peco バージョン
#zplug "b4b4r07/dotfiles", as:command, use:bin/peco-tmux

#enhancd
zplug "b4b4r07/enhancd", use:init.sh

# Also prezto themes
#zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# 選ばれてるモノをハイライト
zstyle ':completion:*:default' menu select=1

# install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
export TERM="xterm-256color"

zplug load

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

#####################################
# envs
#####################################

#terraform
export PATH=$HOME/.terraform-0.7.4:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew use v14.4.0
#nodebrew use v6.9.1
NODE_OPTIONS=--max_old_space_size=4096

# direnv
# TODO: brew install direnv
eval "$(direnv hook zsh)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export EDITOR=vim


# need peco
function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

#GOPATH
if [ -z "${GOPATH:-}" ]; then
  export GOPATH=$HOME/.go
  export GOROOT=/usr/local/opt/go/libexec
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH/.ghq
fi

#ghq + peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
# zle -N peco-src
# ctrl+]で呼び出し
# bindkey '^]' peco-src

function ghq-repo {
  local dir="$( ghq list -p | peco )"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
}

function peco-ssh-tapple () {
  local host="$( cat ~/peco_tapple/peco_setting/list.tky00_cocotsure | peco )"
  if [ ! -z "$host" ] ; then
      BUFFER="ssh `echo $host|awk '{print $1}'`"
      zle accept-line
  fi
  zle clear-screen
}
#zle -N peco-ssh-tapple
#bindkey '^@' peco-ssh-tapple
zle -N peco-ssh-tapple
#ctrl+]で呼び出し
bindkey '^]' peco-ssh-tapple

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 初回シェル時のみ tmux実行
#
#if [ $SHLVL = 1 ]; then
#  tmux
#fi

if [ -f ~/alias ]; then
    . ~/alias
fi

# android setting
export JAVA_HOME="/Applications/Android Studio Beta.app/Contents/jre/Contents/Home"
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$PATH":"$HOME/.pub-cache/bin"

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Desktop/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Desktop/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Desktop/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Desktop/google-cloud-sdk/completion.zsh.inc"; fi

# ssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# flutter
export PATH="$PATH":"$HOME/fvm/default/bin"
#PATH="$PATH:$HOME/.ghq/github.com/flutter/flutter/bin"

# dart
export PATH="$PATH":"usr/lib/dart/bin"

# /usr/local/opt/asdf/asdf.sh
. $(brew --prefix asdf)/libexec/asdf.sh

# Fig post block. Keep at the bottom of this file.
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"
