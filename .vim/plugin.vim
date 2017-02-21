if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug', { 'dir': '~/.vim/plugged/vim-plug/autoload' }
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/vimfiler.vim'
  Plug 'Shougo/unite.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

" ====================
" VimFiler
" ====================
"nnoremap <silent> [unite]e :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" vimfilerでeを押すとtabで開く
" let g:vimfiler_edit_action = 'tabopen'
" 起動時にVimFileerを起動
let file_name = expand("%:p")
if has('vim_starting') && file_name == ""
  autocmd vimenter * VimFiler -simple
endif
