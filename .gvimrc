set nocompatible

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set showmatch
set smarttab
set title
set hidden
set number


" Switch syntax highlighting on, when the terminal has colors
" Also some MacVim GUI settings
if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme darkdesert
  set guioptions=egmt
  highlight SpellBad term=underline gui=undercurl guisp=Orange
  set guifont=Menlo:h12
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
endif

" Enable file type detection.
filetype plugin indent on

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

" filetype completion
autocmd FileType html set ft=htmldjango
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType htmldjango set omnifunc=htmlcomplete#CompleteTags

augroup END

let mapleader = ","

" autoclose
nmap <Leader>x <Plug>ToggleAutoCloseMappings

" comment mappings
nmap <Leader>c :TComment<CR>
nmap <Leader>cj :TCommentAs javascript<CR>
vmap <Leader>c :TComment<CR>
vmap <Leader>cj :TCommentAs javascript<CR>

" quickly close all
map Q :qall<CR>

" Toggle line numbers and fold column
nnoremap <F5> :set nonumber!<CR>:set foldcolumn=0<CR>

" Toggle linewrap
nnoremap <F6> :set wrap!<CR>

" Taglist variables
let g:ctags_statusline=1
let generate_tags=1
let Tlist_Use_Horiz_Window=0
nnoremap TT :TlistToggle<CR>
map <F15> :TlistToggle<CR>
let Tlist_Auto_Update = 1
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Ctags_Cmd = "/opt/local/bin/ctags" 

" tagging
let g:autotagCtagsCmd ="/opt/local/bin/ctags --python-kinds=-i"
nmap <leader>tp <c-W>}
nmap <leader>tg <c-]>
nmap <leader>tl g]

" nerdtree
let NERDTreeChDirMode = 2 " useful with command-t (sets CWD)
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$']
nnoremap <silent> <F13> :NERDTreeToggle<CR>

" command t
let g:CommandTMaxHeight = 10
set wildignore+=.git,*.pyc

" supertab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
imap <nul> <c-x><c-i>
imap <C-Space> <c-x><c-i>
imap <S-Tab> <c-x><c-i>

" pyflakes
nnoremap <F16> :call Pyflakes()<CR>

" preview windows
nnoremap <F17> :ccl<CR>
nnoremap <F18> :pc<CR>

" minibuf toggle
nnoremap <F14> :TMiniBufExplorer<CR>
nmap <leader><Left> :bprev<CR>
nmap <leader><Right> :bnext<CR>

" window navigation
nnoremap <silent> <S-left> :wincmd h<CR>
nnoremap <silent> <S-right> :wincmd l<CR>
nnoremap <silent> <S-down> :wincmd j<CR>
nnoremap <silent> <S-up> :wincmd k<CR>

" conque opens terminal to my devserver
nmap <leader>t :ConqueTermVSplit ssh devserver<CR>

" restart apache on devserver
nmap <leader>r :!ssh devserver "sudo /etc/init.d/apache2 restart"<CR>

" gundo
nnoremap <leader>u :GundoToggle<CR>

" ack
nmap <leader>a <Esc>:Ack!

" can be useful
nmap <F19> ]
