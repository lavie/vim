"nk TODO:
" Try FZF with ripgrep
" Try lexima

let mapleader = "\<space>"
set backspace=indent,eol,start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
let g:angry_disable_maps=1

" Plugin 'davidhalter/jedi-vim'
Bundle 'chase/vim-ansible-yaml'
Bundle 'scrooloose/nerdtree'
Plugin 'alfredodeza/pytest.vim'
Plugin 'Align'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'assaflavie/Dockerfile.vim'
Plugin 'assaflavie/vim-textobj-ipmac'
Plugin 'assaflavie/vim-textobj-underscore'
Plugin 'b4winckler/vim-angry'
Plugin 'bruno-/vim-line'
Plugin 'ctrlp.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'haya14busa/vim-auto-programming'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'junegunn/fzf.vim'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'lpenz/vimcommander'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'matze/vim-move'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-sayonara'
Plugin 'mileszs/ack.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'pangloss/vim-javascript'
Plugin 'qstrahl/vim-dentures'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'suan/vim-instant-markdown'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wellle/visual-split.vim'
Plugin 'wimstefan/Lightning'
" Plugin 'YankRing.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on
filetype plugin indent on
syntax on
aut BufNewFile,BufRead *.json set filetype=json
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType as3 setlocal smartindent
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd filetype crontab setlocal nobackup nowritebackup

set ruler

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
set number
set smarttab
set wildmode=longest,list
set autochdir
set guifont=Menlo\ Regular:h14
set cursorline

set rtp+=/usr/local/opt/fzf


" Easy Grep
let g:EasyGrepRoot = "repository"
let g:EasyGrepFilesToExclude=".git,node_modules"


colorscheme tayra


" For multiple-cursors to function properly
set selection=inclusive

let g:fzf_command_prefix = 'Fzf'


" Enable CtrlP
" let g:ctrlp_show_hidden = 1
" set runtimepath^=~/.vim/bundle/ctrlp.vim

noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>
noremap <C-t> :tabnew
noremap <F2> :NERDTreeToggle<CR>
noremap j gj
noremap k gk
" if (exists("g:ctrlp_custom_ignore"))
"     unlet g:ctrlp_custom_ignore
" endif
" let g:ctrlp_custom_ignore = '\v(dist|reports/node/lib|_meta/_tmp|dockerbuild|node_modules|.ropeproject|\.map|\.git|\.pyc|\.swp|\.egg-info)$'
" " I don't like MRU, and I see no other way to disable it.
" let g:ctrlp_mruf_max = 0


" highlight only lines longer than 120
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%121v', 100)

" Mappings

cabbrev non set nonumber <BAR> :set norelativenumber
cabbrev trail %s/\s\+$//g


" Vimrc itself
augroup my_commands
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost *.go :GoLint
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufRead,BufNewFile *.as set filetype=as3
    autocmd BufRead,BufNewFile *.yml.j2 set filetype=yaml
augroup END

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" Requires: npm install -g eslint babel-eslint
let g:syntastic_javascript_checkers = ['eslint']

vmap <silent> aar <Plug>AngryOuterPrefix
omap <silent> aar <Plug>AngryOuterPrefix
vmap <silent> iar <Plug>AngryInnerPrefix
omap <silent> iar <Plug>AngryInnerPrefix

" After yank, go to end of selection

let g:ackprg = "ag --vimgrep"

" Resize window height
" " And width..


" Sideways

" Abbreviations
cabbrev pla PymodeLintAuto
cabbrev h tab help
cabbrev E Explore
cabbrev a Ag


" JSON
let g:vim_json_syntax_conceal = 0

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
let g:jedi#goto_command = ""


" pymode
let g:pymode_options_max_line_length=120
let g:pymode_rope_completion_bind = '<S-Space>'
let g:pymode_folding=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_lint_ignore = "W0401,C0111,I0011"
let g:pymode_lint_checkers = []
let g:pymode_doc = 0
let g:pymode_rope_autoimport = 0


let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
"
"
" set completefunc=autoprogramming#complete

" Tagbar

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_detect_paste=1
let g:airline#extensions#tabline#fnamemod = ':t'


" Create missing directories when saving file to new path
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

source ~/.vim/bufonly.vim

" Create missing parent dirs on save

function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction


" vim-move
let g:move_map_keys = 0


" Sayonara
"


let g:instant_markdown_slow = 1
"noremap <F8> :TagbarOpenAutoClose<CR>
nnoremap <BS> :noh<CR>
nnoremap <C-_> mb$x`b
nnoremap <c-f> :%! js-beautify --brace-style=collapse-preserve-inline<cr>
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz
nnoremap <Leader>< :SidewaysLeft<CR>
nnoremap <Leader>> :SidewaysRight<CR>
nnoremap <Leader>a :Ack! <C-r><C-w>
nnoremap <Leader>bo :BufOnly<CR>
nnoremap <Leader>c gcc
nnoremap <Leader>gb :w<CR>:GoBuild<CR>
nnoremap <Leader>gd :w<CR>:GoDef<CR>
nnoremap <Leader>gf :w<CR>:GoDecls<CR>
nnoremap <Leader>gi :GoImport 
nnoremap <Leader>gl :w<CR>:GoLint<CR>
nnoremap <Leader>gr :GoRename 
nnoremap <Leader>gt :w<CR>:GoTest<CR>
nnoremap <Leader>gtf :w<CR>:GoTestFunc<CR>
nnoremap <Leader>o :FzfBuffers<CR>
nnoremap <Leader>p :FzfFiles<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vs :write<cr>:so %<cr>:Sayonara<CR>
nnoremap <Leader>w :w<CR>
nnoremap <S-Enter> O<Esc>
nnoremap <S-left> :bp<CR>
nnoremap <S-right> :bn<CR>
nnoremap <silent> + :vert resize +2<CR>
nnoremap <silent> - :resize -2<CR>
nnoremap <silent> <leader>d <Plug>DashSearch
nnoremap <silent> = :resize +2<CR>
nnoremap <silent> _ :vert resize -2<CR>
nnoremap <silent><Leader>q :Sayonara<CR>
nnoremap <silent><Leader>Q :Sayonara<CR>
vnoremap // y/<C-R>"<CR>
vnoremap <C-j> <Plug>MoveBlockDown
vnoremap <C-k> <Plug>MoveBlockUp
vnoremap <C-v> <Plug>(expand_region_shrink)
vnoremap <Leader>c gc
vnoremap <Leader>vs :VSSplitAbove<CR>
vnoremap v <Plug>(expand_region_expand)
vnoremap y ygv<ESC>
