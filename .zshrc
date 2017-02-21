#####################################
# plugins
#####################################
source ~/.zplug/init.zsh

# plugin define
zplug "zplug/zplug"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'

# 必要ならばアーキテクチャ指定
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
# # fzf-tmux の peco バージョン
zplug "b4b4r07/dotfiles", as:command, use:bin/peco-tmux

#enhancd
zplug "b4b4r07/enhancd", use:init.sh

# Also prezto themes
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zstyle ':completion:*:default' menu select=1

# install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

#####################################
# envs
#####################################

#terraform
export PATH=$HOME/.terraform-0.7.4:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew use v6.9.1

# direnv
# TODO: brew install direnv
eval "$(direnv hook zsh)"


#/usr/local/binを優先
export PATH=/usr/local/bin:/usr/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
export EDITOR=vim

# need peco
function agvim () {
  vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

#GOPATH
if [ -z "${GOPATH:-}" ]; then
  export GOPATH=$HOME/go
  export GOROOT=/usr/local/opt/go/libexec
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
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
zle -N peco-src
#ctrl+]で呼び出し
bindkey '^]' peco-src

function peco-ssh-tapple {
  local host="$( cat ~/peco_tapple/peco_setting/list.tky00_cocotsure | peco )"
  if [ ! -z "$host" ] ; then
      BUFFER="ssh `echo $host|awk '{print $1}'`"
      zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ssh-tapple
bindkey '^[' peco-ssh-tapple

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
