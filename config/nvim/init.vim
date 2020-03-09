"" General
set nocompatible
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

set cc=80               " Set column at 80 chars
set mouse=a             " Enable mouse
set encoding=utf-8

"" Advanced
set ruler	        " Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour


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
Plug 'elixir-editors/vim-elixir'        "Syntax highlight
Plug 'bfrg/vim-cpp-modern'              "Syntax highlight

call plug#end()


"" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"" NERDtree config
autocmd vimenter * NERDTree

"" Airline config
let g:airline_powerline_fonts = 0
let g:airline_theme = 'dark'


"" Colorscheme
set background=dark
colorscheme afterglow 


"" Commands
inoremap jj <Esc>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" Auto-pairs brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
