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
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'andrewle/vim-autoclose'          " 勝手に閉じカッコをつける
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

set noimdisable
set iminsert=0 imsearch=0
set noimcmdline

let g:neocomplcache_enable_at_startup = 1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility=1
let g:vimfiler_as_default_explorer = 1

" vim indect-guides
let g:indent_guides_auto_colors = 0
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" nerd tree
NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2

" 編集モード系
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
