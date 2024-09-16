##dotfiles 

[Homebrew](https://brew.sh/)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```
cd ~/
git clone git@github.com:atsumo/dotfiles.git
cd dotfiles
./setup.sh
```

install tpm
```
git clone git@github.com:tmux-plugins/tpm.git .tmux/plugins/tpm
```

vim
```
:PlugClean
:PlugInstall
```

powerline font install
@see https://github.com/powerline/fonts
Run ./install.sh
