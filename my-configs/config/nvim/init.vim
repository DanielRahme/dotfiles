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
"set termguicolors

"" Plugins
" To install the plugins, run cmd in nvim: :PlugInstall
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'               "Git commands in vim
Plug 'rafi/awesome-vim-colorschemes'    "Colorschems
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bfrg/vim-cpp-modern'              "Syntax highlight
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Latest fuzzy finder
Plug 'junegunn/fzf.vim'                 "Fuzzy finder vim
Plug 'rhysd/vim-clang-format'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlight
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'neovim/nvim-lspconfig'

"" Cmp LSP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
call plug#end()


"" Colorscheme
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = 1
let g:gruvbox_bold = 0
let g:gruvbox_italicize_strings = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_invert_signs = 1
let g:gruvbox_number_column = 'bg0'
set background=dark
colorscheme gruvbox

" set sensible highlight matches that don't obscure the text
:highlight MatchParen cterm=underline ctermbg=black ctermfg=NONE
:highlight MatchParen gui=underline guibg=black guifg=NONE


"" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++2a'

" Auto resize syntastic list height"
" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction


"" NERDtree config
" Uncomment to start NerdTree at startup
"autocmd vimenter * NERDTree

"" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_dark'
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


"" Clang format
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>


"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"" Toggle Term


"" Commands
inoremap jj <Esc>
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

" Auto-pairs brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" Tab and shift tab for switching between buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>bd :bp\|bd #<CR>

" Change buffers without saving
set hidden

" Terminal hotkeys and command
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>
tnoremap <leader>td <C-\><C-n> :bp\|bd! #<CR>
nnoremap <leader>td :bp\|bd! #<CR>
" :term should start in insert and without line numbers
command Term :set nonu | startinsert | term
cabbrev term Term
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR> "Change working dir and print


"" Cmp LSP
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF
