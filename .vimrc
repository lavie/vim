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
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'grep.vim'
Plugin 'terryma/vim-expand-region'
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
set wildmode=longest,list


" Enable CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Colors
:colorscheme desert

" Mappings
map <F2> :NERDTreeToggle<CR>
map <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>
map <C-t> :tabnew
nmap <Leader>h :noh<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
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
