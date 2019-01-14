set encoding=utf-8
scriptencoding utf-8
set shell=/bin/sh
set directory=~/src/.swp
set autoread
au FocusGained,BufEnter * :silent! !

" Bundle
filetype off                   " required!

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Gundo'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
" Bundle 'spf13/vim-autoclose'
Bundle 'mileszs/ack.vim'
Bundle 'bufkill.vim'
Bundle 'tpope/vim-fugitive'
" Bundle 'taglist.vim'
Bundle 'Tagbar'
" Bundle 'AutoTag'
Bundle 'mgedmin/pythonhelper.vim'
" Bundle 'pythoncomplete'
Bundle 'python_match.vim'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'surround.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/syntastic'
" Bundle 'tpope/vim-surround'
" Bundle 'oplatek/Conque-Shell'
" Bundle 'wikitopian/hardmode'
Bundle 'kana/vim-textobj-user'
Bundle 'bps/vim-textobj-python'
Bundle 'tpope/vim-repeat'
" Bundle 'svermeulen/vim-easyclip'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wellle/targets.vim'
Bundle 'chrisbra/improvedft'
Bundle 'junegunn/vim-peekaboo'
" Bundle 'digitaltoad/vim-jade'
Bundle 'jpalardy/spacehi.vim'
Bundle 'tpope/vim-sleuth'
Bundle 'maksimr/vim-jsbeautify'
" Bundle 'ternjs/tern_for_vim'
" Bundle 'SirVer/ultisnips'
" Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'
" Bundle 'Raimondi/delimitMate'
Bundle 'buztard/vim-rel-jump'
" Bundle 'tpope/vim-rails'
Bundle 'maxbrunsfeld/vim-yankstack'
" Bundle 'pangloss/vim-javascript'
" Bundle 'mxw/vim-jsx'
" Bundle 'digitaltoad/vim-pug'
" Bundle 'mtscout6/syntastic-local-eslint.vim'
" Bundle 'ruanyl/vim-fixmyjs'
Bundle 'morhetz/gruvbox'
Bundle 'w0ng/vim-hybrid'
" Bundle 'Yggdroot/indentLine'
Bundle 'Vimjas/vim-python-pep8-indent'
Bundle 'airblade/vim-gitgutter'
Bundle 'davidhalter/jedi-vim'
Bundle 'tell-k/vim-autopep8'
Bundle 'tmux-plugins/vim-tmux-focus-events'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-unimpaired'
Bundle 'dyng/ctrlsf.vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'luochen1990/rainbow'
Bundle 'vim-scripts/tcd.vim'
Bundle 'airblade/vim-rooter'


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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set showmatch
set smarttab
set title
set hidden
set number
set relativenumber
set nohlsearch
set visualbell
set scrolljump=8
" set cursorline

set matchpairs+=<:>


" Switch syntax highlighting on, when the terminal has colors
" Also some MacVim GUI settings
if &t_Co > 2 || has('gui_running')
    let g:solarized_contrast='high'
    let g:solarized_termcolors=256
    let g:gruvbox_contrast_dark='high' 
    syntax enable
    set background=dark
    " colorscheme nofrils-dark
    " colorscheme molokai
    colorscheme gruvbox
    " colorscheme Tomorrow-Night
    " colorscheme solarized
    " colorscheme darkdesert
    set guioptions=egmt
    " highlight SpellBad term=underline gui=undercurl guisp=Orange
    " set guifont=Hack:h14
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
autocmd FileType python set colorcolumn=80
autocmd FileType jade set expandtab
autocmd FileType pug set expandtab shiftwidth=2 softtabstop=2
autocmd FileType less set ft=css
autocmd FileType ruby set ft=rails.ruby
autocmd Filetype json let g:indentLine_setConceal = 0
augroup END

call yankstack#setup()

let g:jsx_ext_required = 1

let g:dash_map = {
    \ 'javascript': 'javascript underscore chai jquery mongoose nodejs python'
\ }

let g:mapleader = ','

" nnoremap vp `[v`]
nnoremap <expr> vp '`[' . strpart(getregtype(), 0, 1) . '`]'
vnoremap < <gv
vnoremap > >gv

" Ctrl-S to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Autoinsert ipdb
nmap <leader>i oimport ipdb; ipdb.set_trace()<esc>

" comment mappings
nmap <Leader>c :TComment<CR>
" nmap <Leader>cj :TCommentAs javascript<CR>
vmap <Leader>c :TComment<CR>
" vmap <Leader>cj :TCommentAs javascript<CR>

" quickly close all
nnoremap Q :qall<CR>

" Copy to clipboard
vnoremap <F5> "+y
"
" " Paste from clipboard
nnoremap <F6> "+p

" tagging
" let g:autotagCtagsCmd ='/usr/local/bin/ctags --python-kinds=-i'
" let g:autotagTagsFile='.git/tags'
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = -1
let g:tagbar_foldlevel = 99
let g:tagbar_autoshowtag = 1
nmap <leader>tt :TagbarOpen j<CR>

" nerdtree
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeChDirMode = 2 " useful with command-t (sets CWD)
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeIgnore = ['\.pyc$', 'xmls']

nnoremap <silent> <F13> :NERDTreeToggle<CR>

" ctrl p
set wildignore+=.git,*.pyc,*/venv/,*/xmls/*,*/log/*,*/node_modules/*,*/web/assets/precompiled/*,*/vendor/*,*/web/assets/libs/*,*egg-info*
let g:ctrlp_custom_ignore = 'xmls'
let g:ctrlp_cmd = 'CtrlP getcwd()'
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlPLine<CR>

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_confirm_extra_conf = 0
" set completeopt=menuone,longest,preview
" inoremap <nul> <c-x><c-i>
" inoremap <C-Space> <c-x><c-i>
" inoremap <S-Tab> <c-x><c-i>

nmap <C-l> :close<CR>
" preview windows
nnoremap <F16> :ccl<CR>:pc<CR>:close<CR>
nnoremap <leader>x :ccl<CR>:pc<CR>

" minibuf toggle
" nnoremap <F14> :CtrlPBuffer<CR>
nmap <F14> :set cursorcolumn!<CR>
nmap <F17> :bprev<CR>
nmap <F18> :bnext<CR>

" window navigation
nnoremap <silent> <S-left> :wincmd h<CR>
nnoremap <silent> <S-right> :wincmd l<CR>
nnoremap <silent> <S-down> :wincmd j<CR>
nnoremap <silent> <S-up> :wincmd k<CR>
" nnoremap H :wincmd h<CR>
" nnoremap L :wincmd l<CR>
" nnoremap J :wincmd j<CR>
" nnoremap K :wincmd k<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>ts :set expandtab shiftwidth=2 softtabstop=2<CR>
" gundo
nnoremap <leader>u :GundoToggle<CR>

" ack
let g:ackprg='/usr/local/bin/ag -Q -i'
nmap <leader>a <Esc>:Ack!<Space>
nmap <leader>A <Esc>:Ack! <cword><CR>

noremap <F19> :set hlsearch! hlsearch?<CR>

" Dash
nmap <leader>d <Plug>DashSearch
nmap <leader>D <Plug>DashGlobalSearch

inoremap jk <esc> 
nmap - "
vmap - "
map Y "+y

" For some colorschemes, autocolor will not work (eg: 'desert', 'ir_black')
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121 ctermbg=3
"
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 0
let g:indentLine_indentLevel = 20

" YCM
let g:ycm_filetype_blacklist = { 'xml': 1 }
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3.6'
let g:ycm_auto_trigger = 0
" nnoremap <leader>tg :YcmCompleter GoTo<CR>
" nnoremap <leader>td :YcmCompleter GetDoc<CR>
" nnoremap <leader>tr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>tl :YcmCompleter GoToDeclaration<CR>

let g:jedi#completions_command = "<C-Space>"
let g:jedi#goto_command = "<leader>tg"
let g:jedi#goto_assignments_command = "<leader>ta"
let g:jedi#goto_definitions_command = "<leader>td"
let g:jedi#usages_command = "<leader>tu"
let g:jedi#rename_command = "<leader>tr"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#force_py_version = 3

" Syntatistic
let g:syntastic_python_checkers=['flake8']
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

let g:autopep8_diff_type='vertical'
autocmd FileType python noremap <buffer> <leader>8 :call Autopep8()<CR>

" Airline
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = airline#section#create(['%m'])
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='gruvbox'

nmap <Space> :

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
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0

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

" Peekabo
let g:peekaboo_window = 'vertical botright 50new'

imap <C-b> { }<Esc>hr<cr>O

" Adds j and k motions to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
let g:rainbow_active = 1

let g:rooter_silent_chdir = 1

" Stuff from vimways
function! s:inIndentation()
	" select all text in current indentation level excluding any empty lines
	" that precede or follow the current indentationt level;
	"
	" the current implementation is pretty fast, even for many lines since it
	" uses "search()" with "\%v" to find the unindented levels
	"
	" NOTE: if the current level of indentation is 1 (ie in virtual column 1),
	"       then the entire buffer will be selected
	"
	" WARNING: python devs have been known to become addicted to this

	" magic is needed for this
	let l:magic = &magic
	set magic

	" move to beginning of line and get virtcol (current indentation level)
	" BRAM: there is no searchpairvirtpos() ;)
	normal! ^
	let l:vCol = virtcol(getline('.') =~# '^\s*$' ? '$' : '.')

	" pattern matching anything except empty lines and lines with recorded
	" indentation level
	let l:pat = '^\(\s*\%'.l:vCol.'v\|^$\)\@!'

	" find first match (backwards & don't wrap or move cursor)
	let l:start = search(l:pat, 'bWn') + 1

	" next, find first match (forwards & don't wrap or move cursor)
	let l:end = search(l:pat, 'Wn')

	if (l:end !=# 0)
		" if search succeeded, it went too far, so subtract 1
		let l:end -= 1
	endif

	" go to start (this includes empty lines) and--importantly--column 0
	execute 'normal! '.l:start.'G0'

	" skip empty lines (unless already on one .. need to be in column 0)
	call search('^[^\n\r]', 'Wc')

	" go to end (this includes empty lines)
	execute 'normal! Vo'.l:end.'G'

	" skip backwards to last selected non-empty line
	call search('^[^\n\r]', 'bWc')

	" go to end-of-line 'cause why not
	normal! $o

	" restore magic
	let &magic = l:magic
endfunction

" "in indentation" (indentation level sans any surrounding empty lines)
xnoremap <silent> ii :<c-u>call <sid>inIndentation()<cr>
onoremap <silent> ii :<c-u>call <sid>inIndentation()<cr>

" regular expressions that match numbers (order matters .. keep '\d' last!)
" note: \+ will be appended to the end of each
let s:regNums = [ '0b[01]', '0x\x', '\d' ]

function! s:inNumber()
	" select the next number on the line
	" this can handle the following three formats (so long as s:regNums is
	" defined as it should be above this function):
	"   1. binary  (eg: "0b1010", "0b0000", etc)
	"   2. hex     (eg: "0xffff", "0x0000", "0x10af", etc)
	"   3. decimal (eg: "0", "0000", "10", "01", etc)
	" NOTE: if there is no number on the rest of the line starting at the
	"       current cursor position, then visual selection mode is ended (if
	"       called via an omap) or nothing is selected (if called via xmap)

	" need magic for this to work properly
	let l:magic = &magic
	set magic

	let l:lineNr = line('.')

	" create regex pattern matching any binary, hex, decimal number
	let l:pat = join(s:regNums, '\+\|') . '\+'

	" move cursor to end of number
	if (!search(l:pat, 'ce', l:lineNr))
		" if it fails, there was not match on the line, so return prematurely
		return
	endif

	" start visually selecting from end of number
	normal! v

	" move cursor to beginning of number
	call search(l:pat, 'cb', l:lineNr)

	" restore magic
	let &magic = l:magic
endfunction

" "in number" (next number after cursor on current line)
xnoremap <silent> in :<c-u>call <sid>inNumber()<cr>
onoremap <silent> in :<c-u>call <sid>inNumber()<cr>
