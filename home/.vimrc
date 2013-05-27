set nocompatible               " be iMproved
 
"" for plugin settings
"" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"" original repos on github
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
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'heavenshell/vim-jsdoc'
"" original repos
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

syntax on

" 行表示
set number
set listchars=eol:$,tab:>\
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cursorline

noremap tp :Unite buffer<CR>
noremap th :Unite file_mru<CR>

set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

inoremap , ,<Space>
