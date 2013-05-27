set nocompatible               " be iMproved
 
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
NewBunble 'taichouchou2/vim-javascript'
NeoBundle 'heavenshell/vim-jsdoc'
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"" original repos
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

" 行表示
set number
set listchars=eol:$,tab:>\
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cursorline

" バッファ一覧
noremap tp :Unite buffer<CR>
" ファイル一覧
noremap tn :Unite -buffer-name=file file file/new<CR>
" カレントディレクトリのファイル一覧
noremap to :UniteWithBufferDir -buffer-name=files file file/new<CR>
" 最近使ったファイルの一覧
noremap th :Unite file_mru<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>
