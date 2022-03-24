"" General
set nocompatible
syntax on
set number	        " Show line numbers
set linebreak	        " Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	        " Highlight matching brace
set visualbell	        " Use visual bell (no beeping)

set hlsearch	        " Highlight all search results
set smartcase	        " Enable smart-case search
set ignorecase	        " Always case-insensitive
set incsearch	        " Searches for strings incrementally

set autoindent	        " Auto-indent new lines
set expandtab	        " Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	        " Enable smart-indent
set smarttab	        " Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
set signcolumn=number   " Merge line numbering and git changes


set undofile
set undodir=~/.cache/nvim/undo
set undolevels=10000
set undoreload=10000

" Update replacement live
set inccommand=nosplit

set cc=80               " Set column at 80 chars
set mouse=a             " Enable mouse
set encoding=utf-8

" Sets ',' as the leader key for hotkeys
let maplocalleader = ','
let mapleader = ','

"" Advanced
set ruler	        " Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set termguicolors

"" Plugins
" To install the plugins, run cmd in nvim: :PlugInstall
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'               "Git commands in vim
Plug 'rafi/awesome-vim-colorschemes'    "Colorschems
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'elixir-editors/vim-elixir'        "Syntax highlight
Plug 'bfrg/vim-cpp-modern'              "Syntax highlight
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Latest fuzzy finder
Plug 'junegunn/fzf.vim'                 "Fuzzy finder vim
call plug#end()


"" Colorscheme
set background=dark
colorscheme dracula


"" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"" NERDtree config
" Uncomment to start NerdTree at startup
"autocmd vimenter * NERDTree

"" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set showtabline=2
set laststatus=2

""Fzf fuzzy finder config
nnoremap <C-p> :Files<Cr>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Need to install 'bat' for preview colors
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


"" Commands
inoremap jj <Esc>
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p
" Auto-pairs brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Tab and shift tab for switching between buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>bd :bp\|bd #<CR>

" Change buffers without saving
set hidden

" Terminal hotkeys and command
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>td <C-\><C-n> :bp\|bd! #<CR>
nnoremap <leader>td :bp\|bd! #<CR>
" :term should start in insert and without line numbers
command Term :set nonu | startinsert | term
cabbrev term Term
