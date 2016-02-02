let mapleader = "\<space>"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'tpope/vim-salve'
Plugin 'scrooloose/syntastic'
Plugin 'wellle/visual-split.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'rizzatti/dash.vim'
Bundle 'chase/vim-ansible-yaml'
Bundle 'scrooloose/nerdtree'
Plugin 'alfredodeza/pytest.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'bruno-/vim-line'
Plugin 'ctrlp.vim'
Plugin 'assaflavie/Dockerfile.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'matze/vim-move'
Plugin 'mhinz/vim-sayonara'
Plugin 'nelstrom/vim-qargs'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

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

" Highlight when a line ends with spaces or starts with tab
exec "set listchars=tab:>~,trail:\uB7,nbsp:~"
set list

colorscheme desert
" Visual selection split
vnoremap <Leader>v :VSSplitAbove<CR>
nnoremap <Leader>bo :BufOnly<CR>

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


" highlight only lines longer than 120
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

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

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Requires: npm install -g eslint babel-eslint
let g:syntastic_javascript_checkers = ['eslint']


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


" Sideways
nnoremap <Leader>> :SidewaysRight<CR>
nnoremap <Leader>< :SidewaysLeft<CR>

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
cabbrev jsp :%!python -m json.tool
cabbrev bo BufOnly
ab ipy __import__("IPython").embed()

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

source ~/.vim/bufonly.vim


autocmd BufRead,BufNewFile *.as set filetype=as3

" vim-move
let g:move_map_keys = 0

vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp

" Sayonara
