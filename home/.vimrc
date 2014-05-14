autocmd!

set nocompatible               " be improved
filetype off                   " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " required!

" installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'please execute ":neobundleinstall" command.'
  "finish
endif

"" original repos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'vimclojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'chaquotay/ftl-vim-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'andrewle/vim-autoclose'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'editorconfig/editorconfig-vim'

" tagbar
NeoBundle 'majutsushi/tagbar'
" open browser
NeoBundle 'tyru/open-browser.vim'
" tern for vim
""NeoBundle 'marijnh/tern_for_vim'

" color schemes
NeoBundle 'goatslacker/mango.vim'
" nerdtree
NeoBundle 'scrooloose/nerdtree.git'

" 行表示
set number
set list
set listchars=tab:>\ ,trail:_,nbsp:%,extends:>,precedes:<
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set expandtab
set autoindent
set cursorline
set backspace=indent,eol,start
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline

" ====================
" color scheme
" ====================
syntax enable
set t_co=256
set background=dark
colorscheme mango

" highlight
highlight cursorline ctermbg=237
highlight pmenu ctermbg=179 ctermfg=16 cterm=bold
" 連続ペースト
vnoremap <silent> <c-p> "0p<cr>

" highlight
set hlsearch

" mouse optios
if has("mouse")
  set mouse=a
endif

let g:neocomplcache_enable_at_startup = 1

" ====================
" neo-snippets
" ====================
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/snippets'

" supertab like snippets behavior.
"imap <expr><tab> neosnippet#expandable() <bar><bar> neosnippet#jumpable() ? "\<plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-n>" : "\<tab>"
"smap <expr><tab> neosnippet#expandable() <bar><bar> neosnippet#jumpable() ? "\<plug>(neosnippet_expand_or_jump)" : "\<tab>"
" same :unite snippet
"imap <c-s>  <plug>(neocomplcache_start_unite_snippet)

" for snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" tell neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility=1
let g:vimfiler_as_default_explorer = 1

" vim indect-guides
let g:indent_guides_auto_colors = 0
" set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd vimenter,colorscheme * :hi indentguidesodd  guibg=red   ctermbg=3
autocmd vimenter,colorscheme * :hi indentguideseven guibg=green ctermbg=4

" nerd tree
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
""set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする


" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile



"" clipboard
set clipboard+=unnamed
set clipboard+=autoselect


""
inoremap <silent> <C-j> <ESC>

" ====================
" unite
" ====================
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
nmap <silent><buffer> <ESC><ESC> q
imap <silent><buffer> <ESC><ESC> <ESC>q
nnoremap [unite] <Nop>
nmap <Leader>u [unite]

nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir file_mru<CR>
nnoremap <silent> [unite]u :<C-u>Unite file_mru<CR>
" nnoremap <silent> [unite]k :<C-u>Unite bookmark<CR>
" nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

" unite yank history
let g:unite_source_history_yank_enable = 1
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

" let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 100
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opts = ''
let g:unite_source_grep_max_candidates = 200

vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

" ====================
" VimFiler
" ====================
nnoremap <silent> [unite]e :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" ====================
" Tagbar
" ====================
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" unite yank history
let g:unite_source_history_yank_enable = 1
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

"jshint
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
let g:syntastic_javascript_checkers = ['jshint'] "jshintを使う
"let g:syntastic_javascript_jshint_conf = '~/.jshintrc'
" Emmet
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" ,scで構文チェック
nnoremap ,sc :<C-u>SyntasticCheck<CR>"

" tern
"autocmd FileType javascript setlocal omnifunc=tern#Complete

" insert
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k
