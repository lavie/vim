let mapleader = "\<space>"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
"Plugin 'majutsushi/tagbar' " Slow...
"Plugin 'airblade/vim-gitgutter' " This seems very slow...
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'alfredodeza/pytest.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'davidhalter/jedi-vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'grep.vim'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'
Plugin 'mhinz/vim-sayonara'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'ctrlp.vim'
Bundle 'chase/vim-ansible-yaml'
Plugin 'takac/vim-hardtime'
"
"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on
filetype plugin indent on
syntax on
set ruler
set number
set incsearch
set hlsearch
set expandtab
set smartindent
set tabstop=4
set nocompatible
set wildmenu
set ignorecase
set shiftwidth=4
set hidden
set relativenumber
set smarttab
set wildmode=longest,list
set autochdir
set guifont=Menlo\ Regular:h14
set cursorline

" For multiple-cursors to function properly
set selection=inclusive

" Enable CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-e>'],
"     \ 'AcceptSelection("t")': ['<cr>'],
"     \ }
nmap <Leader>p :<C-U>CtrlP<CR>
let g:ctrlp_custom_ignore = { 'file' : '\.pyc$', 'dir' : '(\.git$|/dockerbuild/)' }

" Colors
:colorscheme desert

" Mappings

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz
nnoremap <S-Enter> O<Esc>
noremap <F2> :NERDTreeToggle<CR>
noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>
nnoremap <S-left> :bp<CR>
nnoremap <S-right> :bn<CR>
nnoremap <silent><S-down>  :Sayonara<CR>
noremap <C-t> :tabnew 
nnoremap <S-h> :tabnext<CR>
nnoremap <S-l> :tabprev<CR>

noremap j gj
noremap k gk
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>t :tabedit 

nnoremap <Leader>ve :tabedit $MYVIMRC<CR>
nnoremap <Leader>vs :write<cr>:so %<cr>:Sayonara<CR>

" replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" search with Ack for word under cursor
nnoremap <Leader>a :Ag <C-r><C-w>
" Resize window height
nnoremap = :resize +2<CR>
nnoremap - :resize -2<CR>
" And width..
nnoremap + :vert resize +2<CR>
nnoremap _ :vert resize -2<CR>


" Toggle comment with Leader-c
nmap <Leader>c gcc
vmap <Leader>c gcc

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" Abbreviations
cabbrev h tab help
cabbrev E Explore
cabbrev a Ag
cabbrev pla PymodeLintAuto
ab ipy import IPython; IPython.embed()

" " Make sure bash_profile is loaded in vim.
set shell=bash\ --login

" DiffView
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Python (Jedi-VIM)
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
 
" PrettyJs
com! Prettyjs call JsBeautify()

" Tagbar
"noremap <F8> :TagbarOpenAutoClose<CR> 

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_detect_paste=1


" Hard-time
let g:hardtime_default_on = 1

" Create missing directories when saving file to new path
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd! BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END


" Argumentative
nmap [; <Plug>Argumentative_Prev
nmap ]; <Plug>Argumentative_Next
xnoremap [; <Plug>Argumentative_XPrev
xnoremap ]; <Plug>Argumentative_XNext
nnoremap <; <Plug>Argumentative_MoveLeft
nnoremap >; <Plug>Argumentative_MoveRight
xnoremap i; <Plug>Argumentative_InnerTextObject
xnoremap a; <Plug>Argumentative_OuterTextObject
onoremap i; <Plug>Argumentative_OpPendingInnerTextObject
onoremap a; <Plug>Argumentative_OpPendingOuterTextObject


source ~/.vim/bufonly.vim


" Sayonara
nnoremap <leader>q :Sayonara<cr>
nnoremap <leader>Q :Sayonara!<cr>
