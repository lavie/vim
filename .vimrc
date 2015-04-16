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
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'alfredodeza/pytest.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'davidhalter/jedi-vim'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'grep.vim'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'ctrlp.vim'
Bundle 'chase/vim-ansible-yaml'
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
set smarttab
set wildmode=longest,list
set autochdir
set guifont=Menlo\ Regular:h14
set cursorline

" Enable CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-e>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" Colors
:colorscheme desert

" Mappings

nmap <C-j> 10jzz
nmap <C-k> 10kzz
nmap <S-Enter> O<Esc>
map <F2> :NERDTreeToggle<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
nmap <S-left> :bp<CR>
nmap <S-right> :bn<CR>
nmap <S-down> :bd<CR>
map <C-t> :tabnew 
nmap <C-S-Left> :tabmove -1<CR>
nmap <C-S-Right> :tabmove +1<CR>
map j gj
map k gk
nmap <Leader>h :noh<CR>

" replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" search with Ack for word under cursor
nnoremap <Leader>a :Ag <C-r><C-w>
" Resize window height
nmap = :resize +2<CR>
nmap - :resize -2<CR>
" And width..
nmap + :vert resize +2<CR>
nmap _ :vert resize -2<CR>


" Toggle comment with Leader-c
map <Leader>c gcc


" Abbreviations
cabbrev h tab help
cabbrev E Explore
cabbrev a Ag
cabbrev pla PymodeLintAuto

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
 
" PrettyJs
com! Prettyjs call JsBeautify()

" Tagbar
"map <F8> :TagbarOpenAutoClose<CR> 

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1


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
