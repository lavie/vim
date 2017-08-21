let mapleader = "\<space>"
set backspace=indent,eol,start
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle, required
" let g:angry_disable_maps=1

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'
Plug 'Quramy/vison'
Plug 'SirVer/ultisnips'
Plug 'alfredodeza/pytest.vim'
Plug 'assaflavie/Dockerfile.vim'
Plug 'assaflavie/vim-textobj-ipmac'
Plug 'assaflavie/vim-textobj-underscore'
Plug 'b4winckler/vim-angry'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'bruno-/vim-line'
Plug 'chase/vim-ansible-yaml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkprice/vim-easygrep'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'vim-scripts/nginx.vim'
Plug 'fatih/vim-go'
Plug 'francoiscabrol/ranger.vim'
Plug 'gmarik/Vundle.vim'
Plug 'guns/vim-clojure-static'
Plug 'hashivim/vim-terraform'
Plug 'haya14busa/vim-auto-programming'
Plug 'jelera/vim-javascript-syntax'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'klen/python-mode'
Plug 'lpenz/vimcommander'
Plug 'maksimr/vim-jsbeautify'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'matze/vim-move'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-sayonara'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-qargs'
Plug 'pangloss/vim-javascript'
Plug 'qstrahl/vim-dentures'
Plug 'rhysd/clever-f.vim'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-scripts/Align'
Plug 'vim-scripts/Greplace.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'wellle/visual-split.vim'
Plug 'wimstefan/Lightning'
call plug#end()

" All of your Plugins must be added before the following line
" call vundle#end()            " required
filetype plugin on
filetype plugin indent on
syntax on
aut BufNewFile,BufRead *.json set filetype=json
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType as3 setlocal smartindent
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd filetype crontab setlocal nobackup nowritebackup

set ruler

set autochdir
set cursorline
set expandtab
set gdefault " use global flag by default in s: commands
set guifont=Menlo\ Regular:h14
set hidden
set hlsearch
set ignorecase
set incsearch
set number
set relativenumber
set shiftwidth=4
set smarttab
set tabstop=4
set wildmenu
set wildmode=longest,list

set rtp+=/usr/local/opt/fzf

let g:ranger_map_keys = 0
let g:netrw_banner = 0 " Turn off banner

" Easy Grep
let g:EasyGrepRoot = "repository"
let g:EasyGrepFilesToExclude=".git,node_modules"

let g:terraform_align=1

colorscheme tayra


runtime autoload/grepper.vim  " initialize g:grepper with default values
let g:grepper.dir = 'file'

" For multiple-cursors to function properly
set selection=inclusive

let g:fzf_command_prefix = 'Fzf'


" Enable CtrlP
" let g:ctrlp_show_hidden = 1
" set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_open_multiple_files = 'v'

noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>
noremap <C-t> :tabnew
noremap <F2> :NERDTreeToggle<CR>
noremap j gj
noremap k gk
nnoremap <Leader>g :Grepper<CR>
nnoremap <Leader>r :Ranger<CR>
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

function! StripTrailingWS()
    %s/\s\+$//e
endfunction


" Vimrc itself
augroup my_commands
    autocmd!
    autocmd BufWritePre * call StripTrailingWS()
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost *.go :GoLint
    autocmd bufwritepost *.tf :TerraformFmt
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd BufRead,BufNewFile *.as set filetype=as3
    autocmd BufRead,BufNewFile *.yml.j2 set filetype=yaml
augroup END

let g:ale_javascript_eslint_executable="/Users/assaf/.nvm/versions/node/v4.4.5/bin/eslint"
let g:ale_javascript_eslint_options="-c ~/binaris/spice/.eslintrc.js"
let g:ale_python_pylint_use_global=1

let g:ale_emit_conflict_warnings=0

let g:ale_linters = {
\   'javascript': ['eslint'],
\}


vmap <silent> aar <Plug>AngryOuterPrefix
omap <silent> aar <Plug>AngryOuterPrefix
vmap <silent> iar <Plug>AngryInnerPrefix
omap <silent> iar <Plug>AngryInnerPrefix

vnoremap Y "*y

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


" pymode
let g:pymode_options_max_line_length=80
let g:pymode_rope_completion_bind = '<S-Space>'
let g:pymode_folding=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_lint_ignore = "W0401,C0111,I0011"
let g:pymode_lint_checkers = []
let g:pymode_doc = 0
let g:pymode_rope_autoimport = 0


" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_detect_paste=1
let g:airline#extensions#tabline#fnamemod = ':t'


set directory^=$HOME/.vim/tmp//

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
nnoremap <Leader>tff :TerraformFmt<CR>
nnoremap <Leader>bw :e ~/vimwiki/binaris.wiki<CR>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>


" inside/around slashes (text object)
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR>
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR>

" inside around semi-colon
onoremap <silent> i; :<C-U>normal! T;vt;<CR>
onoremap <silent> a; :<C-U>normal! F;vf;<CR>
xnoremap <silent> i; :<C-U>normal! T;vt;<CR>
xnoremap <silent> a; :<C-U>normal! F;vf;<CR>

nnoremap <leader>fa :FzfAg<CR>
nnoremap <leader>fl :FzfBLines<CR>
au FileType go nmap <leader>gx <Plug>(go-run)<CR>
au FileType go nmap <Leader>gb :w<CR>:GoBuild<CR>
au FileType go nmap <Leader>gd :w<CR>:GoDef<CR>
au FileType go nmap <Leader>gf :w<CR>:GoDecls<CR>
au FileType go nmap <Leader>gi :GoImport
au FileType go nmap <Leader>gl :w<CR>:GoLint<CR>
au FileType go nmap <Leader>gr :GoRename
au FileType go nmap <Leader>gt :w<CR>:GoTest<CR>
au FileType go nmap <Leader>gtf :w<CR>:GoTestFunc<CR>

nnoremap <Leader>o :FzfBuffers<CR>
nnoremap <Leader>p :FzfFiles<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vs :noautocmd write<cr>:so %<cr>:Sayonara<CR>
nmap <Leader>vwi <Plug>VimwikiIndex
nmap <Leader>vws :VimwikiSearch
nnoremap <Leader>w :w<CR>
nnoremap <S-Enter> O<Esc>
nnoremap <S-left> :bp<CR>
nnoremap <S-right> :bn<CR>
nnoremap <Leader>l :set list!<CR>
vnoremap <silent><leader>y :w !pbcopy<CR>
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
vnoremap <Leader>vsa :VSSplitAbove<CR>
vnoremap v <Plug>(expand_region_expand)
vnoremap y ygv<ESC>
nnoremap <Leader>sp :set paste<CR>

let tern_map_prefix="<Leader>j"
let tern_map_keys=1
