# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew npm homesick)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [[ -f ~/nvm/nvm.sh ]]; then
  source ~/nvm/nvm.sh

  if which nvm >/dev/null 2>&1 ;then
    _nodejs_use_version="v0.8.14"
    if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
      nvm use "${_nodejs_use_version}" >/dev/null
      export NODE_PATH=${NVM_PATH}_modules${NODE_PATH:+:}${NODE_PATH}
    fi
    unset _nodejs_use_version
  fi
fi