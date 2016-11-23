set nocompatible
:set dir=~/src/.swp

" Bundle
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Gundo'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
""Bundle 'spf13/vim-autoclose'
Bundle 'mileszs/ack.vim'
Bundle 'bufkill.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'AutoTag'
Bundle 'pythonhelper'
Bundle 'pythoncomplete'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'Indent-Guides'
Bundle 'Valloric/YouCompleteMe'
Bundle 'surround.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'oplatek/Conque-Shell'
Bundle 'wikitopian/hardmode'
Bundle 'kana/vim-textobj-user'
Bundle 'bps/vim-textobj-python'
Bundle 'tpope/vim-repeat'
" Bundle 'svermeulen/vim-easyclip'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wellle/targets.vim'
Bundle 'chrisbra/improvedft'
Bundle 'junegunn/vim-peekaboo'
Bundle 'digitaltoad/vim-jade'
Bundle 'jpalardy/spacehi.vim'
Bundle 'tpope/vim-sleuth'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'ternjs/tern_for_vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'buztard/vim-rel-jump'
Bundle 'tpope/vim-rails'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'digitaltoad/vim-pug'
Bundle 'mtscout6/syntastic-local-eslint.vim'
Bundle 'ruanyl/vim-fixmyjs'

" Enable file type detection.
filetype plugin indent on

" work around for security issue
set nomodeline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" common settings
set nobackup
set history=50
set ruler
set showcmd
set incsearch
set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set showmatch
set smarttab
set title
set hidden
set number
set relativenumber
set nohlsearch
set vb
set cursorline

set matchpairs+=<:>


" Switch syntax highlighting on, when the terminal has colors
" Also some MacVim GUI settings
if &t_Co > 2 || has("gui_running")
    let g:solarized_contrast="high"
    let g:solarized_termcolors=256
    syntax enable
    set background=dark
    colorscheme Tomorrow-Night
    " colorscheme solarized
    " colorscheme darkdesert
    set guioptions=egmt
    highlight SpellBad term=underline gui=undercurl guisp=Orange
    set guifont=Monaco:h14
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 75 characters.
autocmd BufRead,BufNewFile *.txt
\ setlocal textwidth=75 wrap formatoptions=tcqn

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

au BufRead,BufNewFile *.py set list " show tabs, so we can hunt them down and kill them
au BufRead,BufNewFile *.py set listchars=tab:>-"


" filetype completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType jade set expandtab
autocmd FileType pug set expandtab shiftwidth=2 softtabstop=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType less set ft=css
autocmd FileType ruby set ft=rails.ruby
augroup END

let g:jsx_ext_required = 0

let g:dash_map = {
    \ 'javascript': 'javascript underscore chai jquery mongoose nodejs'
\ }

let mapleader = ","

let python_version_2 = 1

nnoremap gp `[v`]
vnoremap < <gv
vnoremap > >gv

" Ctrl-S to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Autoinsert ipdb
nmap <leader>i oimport ipdb; ipdb.set_trace()<esc>

" autoclose
nmap <Leader>x <Plug>ToggleAutoCloseMappings

" comment mappings
nmap <Leader>c :TComment<CR>
" nmap <Leader>cj :TCommentAs javascript<CR>
vmap <Leader>c :TComment<CR>
" vmap <Leader>cj :TCommentAs javascript<CR>

" quickly close all
nnoremap Q :qall<CR>

" Copy to clipboard
nnoremap <F5> "+y
"
" " Paste from clipboard
nnoremap <F6> "+p

" Taglist variables
let g:ctags_statusline=1
let generate_tags=1
let Tlist_Use_Horiz_Window=0
nnoremap TT :TlistToggle<CR>
nnoremap <F15> :TagbarToggle<CR>
let Tlist_Auto_Update = 1
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags" 

" tagging
let g:autotagCtagsCmd ="/usr/local/bin/ctags --python-kinds=-i"
nmap <leader>tp <c-W>}
nmap <leader>tg <c-]>
nmap <leader>tl g]

" nerdtree
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode = 2 " useful with command-t (sets CWD)
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$', 'xmls']

nnoremap <silent> <F13> :NERDTreeToggle<CR>

" ctrl p
set wildignore+=.git,*.pyc,*/venv/,*/xmls/*,*/log/*,*/node_modules/*,*/web/assets/precompiled/*,*/vendor/*,*/web/assets/libs/*
let g:ctrlp_custom_ignore = 'xmls'
let g:ctrlp_cmd = 'CtrlP getcwd()'
nmap <leader>p :CtrlPLine<CR>

" supertab
let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" set completeopt=menuone,longest,preview
" inoremap <nul> <c-x><c-i>
" inoremap <C-Space> <c-x><c-i>
" inoremap <S-Tab> <c-x><c-i>

nmap <C-l> :close<CR>
" preview windows
nnoremap <F16> :ccl<CR>:pc<CR>

" minibuf toggle
nnoremap <F14> :CtrlPBuffer<CR>
nmap <F17> :bprev<CR>
nmap <F18> :bnext<CR>

" window navigation
nnoremap <silent> <S-left> :wincmd h<CR>
nnoremap <silent> <S-right> :wincmd l<CR>
nnoremap <silent> <S-down> :wincmd j<CR>
nnoremap <silent> <S-up> :wincmd k<CR>
nnoremap H :wincmd h<CR>
nnoremap L :wincmd l<CR>
nnoremap J :wincmd j<CR>
nnoremap K :wincmd k<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>st :set expandtab shiftwidth=2 softtabstop=2<CR>
" gundo
nnoremap <leader>u :GundoToggle<CR>

" ack
let g:ackprg="/usr/local/bin/ag -Q -i --nocolor --nogroup --column --ignore-dir=venv --ignore-dir=web/app/i18n --ignore tags --ignore-dir=backend/docs --ignore-dir=web/assets/precompiled --ignore-dir=web/assets/libs --ignore-dir=src/js"
nmap <leader>a <Esc>:Ack!

noremap <F19> :set hlsearch! hlsearch?<CR>

" Dash
nmap <leader>d <Plug>DashSearch
nmap <leader>D <Plug>DashGlobalSearch

inoremap jk <esc> 
nmap - "
vmap - "
vmap Y "+y

" For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3

autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" YCM
let g:ycm_filetype_blacklist = { 'xml': 1 }
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_auto_trigger = 0
nnoremap <leader>gt :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Tern
nnoremap <leader>e :TernRename<CR>

" Syntatistic
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list=1
function! FixJS()
    "Save current cursor position"
    let l:winview = winsaveview()
    "run eslint fix on current buffer"
    ! ./node_modules/.bin/eslint --fix %
    "Restore cursor position"
    call winrestview(l:winview)
endfunction
command! FixJS :call FixJS()

" Airline
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = airline#section#create(['%m'])
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

nmap <Space> :
nmap <S-Space> /

" Avoid setting caps with u
vmap u <nop>
vmap U <nop>

" Hardmode
nnoremap <leader>H <Esc>:call ToggleHardMode()<CR>
nmap <left> <nop>
nmap <right> <nop>
nmap <up> <nop>
nmap <down> <nop>

" python textblock
nmap <leader>nf ]pf
nmap <leader>pf [pf
nmap <leader>nc ]pc
nmap <leader>pc [pc

" Prefering single tick
" nmap ' `

" EasyMotion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings"
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" HJKL motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" search motions
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map  <Leader>w <Plug>(easymotion-bd-w)

" ft improved
let g:ft_improved_ignorecase = 1

" Fugitive
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gbrowse<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gr :Gread<CR>

" Danish keyboard
imap æ [
imap ø ]
imap Æ {
imap Ø }

imap <C-b> { }<Esc>hr<cr>O
