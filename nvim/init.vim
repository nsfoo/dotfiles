set shell=/bin/sh " set default shell for improving performance for vim-slime https://github.com/jpalardy/vim-slime/issues/204#issuecomment-505775281
"base neovim
set guifont=FiraCodeNerdFont:h15
set termguicolors
set noshowmode
set splitbelow
set splitright
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set clipboard+=unnamedplus
set hidden
set updatetime=100
set signcolumn=number
set noswapfile
set nobackup
set nowritebackup
set cursorline
"base mappings
inoremap jj <ESC>
nnoremap m d|xnoremap m d
nnoremap M D|xnoremap M D
nnoremap mm dd|xnoremap mm dd
nnoremap Y y$|xnoremap Y y$
nnoremap <C-l> :noh<CR>
nnoremap J gT
nnoremap K gt
let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :noa w<CR>
nnoremap <Leader>q :close<CR>
nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><tab> <C-w><C-w>
"set fish indent
autocmd FileType fish setlocal shiftwidth=4 softtabstop=4 expandtab

let vimplug_exists = expand(stdpath('data') . '/site/autoload/plug.vim')
if filereadable(vimplug_exists)
  source ~/.config/nvim/plug.vim
endif
