set encoding=utf-8
scriptencoding utf-8
set shell=/bin/sh
set directory=~/src/.swp
set autoread
au FocusGained,BufEnter * :silent! !

" Bundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()

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

set rtp+=/usr/local/bin/fzf

" Plugins
Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-rooter'
Plugin 'buztard/vim-rel-jump'
Plugin 'junegunn/vim-peekaboo'
Plugin 'chrisbra/improvedft'
Plugin 'rizzatti/dash.vim'
Plugin 'bufkill.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'deoplete-plugins/deoplete-jedi'

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

" quickly close all
nnoremap Q :qall<CR>
nmap <C-l> :close<CR>
" preview windows
nnoremap <leader>x :ccl<CR>:pc<CR>

" window navigation
nnoremap <silent> <S-left> :wincmd h<CR>
nnoremap <silent> <S-right> :wincmd l<CR>
nnoremap <silent> <S-down> :wincmd j<CR>
nnoremap <silent> <S-up> :wincmd k<CR>

" splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" ack
let g:ackprg='/usr/local/bin/ag -Q -i'
nmap <leader>a <Esc>:Ack!<Space>
nmap <leader>A <Esc>:Ack! <cword><CR>
nnoremap <leader>ts :set expandtab shiftwidth=2 softtabstop=2<CR>

nmap <Space> :

" Adds j and k motions to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Avoid setting caps with u
vmap u <nop>
vmap U <nop>
inoremap jk <esc>
nmap - "
vmap - "
map Y "+y

" Syntatistic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_always_populate_loc_list=1

" Airline
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = airline#section#create(['%m'])
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='gruvbox'

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
" FZF
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>oc :Files ~/src/oc/<CR>


let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Fugitive
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gbrowse<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gr :Gread<CR>

" jedi
let g:jedi#completions_command = "<C-Space>"
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>tg"
let g:jedi#goto_assignments_command = "<leader>ta"
let g:jedi#goto_definitions_command = "<leader>td"
let g:jedi#usages_command = "<leader>tu"
let g:jedi#rename_command = "<leader>tr"
" let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#force_py_version = 3

" deoplete
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" TComment
nmap <Leader>c :TComment<CR>
vmap <Leader>c :TComment<CR>

" Yankstack
call yankstack#setup()

" chdir rooter
let g:rooter_silent_chdir = 1

" Peekabo
let g:peekaboo_window = 'vertical botright 50new'

" Dash
nmap <leader>d <Plug>DashSearch
nmap <leader>D <Plug>DashGlobalSearch

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
