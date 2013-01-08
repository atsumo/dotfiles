set nocompatible               " be iMproved
set listchars=eol:$,tab:>\ 
"================================================================================
"" for plugin settings
"================================================================================
"" neobundle
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"" original repos on github
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'chaquotay/ftl-vim-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript' " jQuery syntax追加
NeoBundle 'kchmck/vim-coffee-script'

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"" original repos
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on
