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
" Bundle 'klen/python-mode'
Plugin 'tpope/vim-surround'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'grep.vim'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-expand-region'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
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


" Enable CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1

" Colors
:colorscheme desert

" Mappings
map <F2> :NERDTreeToggle<CR>
map <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>
map <C-t> :tabnew
map <C-S-Left> :tabmove -1<CR>
map <C-S-Right> :tabmove +1<CR>
nmap <Leader>h :noh<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nmap <C-W> :tabclose<CR>
" Resize window height
nmap = :resize +2<CR>
nmap - :resize -2<CR>
" And width..
nmap + :vert resize +2<CR>
nmap _ :vert resize -2<CR>

" Abbreviations
cabbrev h tab help
cabbrev E Explore
cabbrev a Ack
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
command Prettyjs call JsBeautify()
