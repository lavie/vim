let mapleader = "\<space>"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'rizzatti/dash.vim'
Bundle 'chase/vim-ansible-yaml'
Bundle 'scrooloose/nerdtree'
Plugin 'alfredodeza/pytest.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'bruno-/vim-line'
Plugin 'ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'matze/vim-move'
Plugin 'mhinz/vim-sayonara'
Plugin 'nelstrom/vim-qargs'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

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
" set smartindent
set tabstop=4
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
nmap <Leader>p :<C-U>CtrlPMixed<CR>
if (exists("g:ctrlp_custom_ignore"))
    unlet g:ctrlp_custom_ignore
endif
let g:ctrlp_custom_ignore = '\v(dist|dockerbuild|node_modules|.ropeproject|\.git|\.pyc|\.swp|\.egg-info)$'
" I don't like MRU, and I see no other way to disable it.
let g:ctrlp_mruf_max = 0

" Mappings

inoremap jk <Esc>
nnoremap <Leader>w :w<CR>
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz
nnoremap <S-Enter> O<Esc>
noremap <F2> :NERDTreeToggle<CR>
noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>
nnoremap <S-left> :bp<CR>
nnoremap <S-right> :bn<CR>
nmap <silent><Leader>q :Sayonara<CR>
nmap <silent><Leader>Q :Sayonara<CR>
noremap <C-t> :tabnew 
nnoremap <S-h> :tabnext<CR>
nnoremap <S-l> :tabprev<CR>

noremap j gj
noremap k gk
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>t :tabedit 

nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vs :write<cr>:so %<cr>:Sayonara<CR>


" After yank, go to end of selection
vmap y ygv<ESC>

" replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" search with Ack for word under cursor
nnoremap <Leader>a :Ag <C-r><C-w>
" Resize window height
nnoremap <silent> = :resize +2<CR>
nnoremap <silent> - :resize -2<CR>
" And width..
nnoremap <silent> + :vert resize +2<CR>
nnoremap <silent> _ :vert resize -2<CR>



" Startify


let g:startify_bookmarks = [ '~/.bash_profile', '~/Dropbox/sparta/core', '~/Dropbox/optibus/armada', '/etc/hosts' ]

" Toggle comment with Leader-c
nmap <Leader>c gcc
vmap <Leader>c gc

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" Abbreviations
cabbrev pla PymodeLintAuto
cabbrev h tab help
cabbrev E Explore
cabbrev a Ag
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
" let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0

" Flake8
" autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
 
" PrettyJs
com! Prettyjs call JsBeautify()
com! Prettyhtml call HtmlBeautify()

" pymode
let g:pymode_options_max_line_length=120
let g:pymode_rope_completion_bind = '<S-Space>'
let g:pymode_folding=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_lint_ignore = "W0401"
let g:pymode_doc = 0

" Tagbar
"noremap <F8> :TagbarOpenAutoClose<CR> 

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
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

nmap <silent> <leader>d <Plug>DashSearch

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

" vim-move
let g:move_map_keys = 0

vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp

" Sayonara
