call plug#begin(stdpath('data') . '/plugged')
"theme 
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim'
Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
Plug 'bluz71/vim-moonfly-colors'
Plug 'lifepillar/vim-solarized8'
"base
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'justinmk/vim-sneak'
Plug 'steelsojka/pears.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'tpope/vim-abolish'
"utils
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'katusk/vim-qkdb-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"repl
Plug 'jpalardy/vim-slime'
"org 
Plug 'nvim-orgmode/orgmode'
"fish formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
call plug#end()
lua require("plugins")
colorscheme moonfly
let g:lightline = { 'colorscheme' : 'moonfly'}
"vim-sneak
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
"vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
"telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
"vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "#%%"
nmap <leader>c <Plug>SlimeSendCell
nmap <leader>p <Plug>SlimeParagraphSend
let g:slime_python_ipython = 1
function SlimeOverride_EscapeText_q(text)
  if len(split(a:text,"\n")) > 1
    return ["multi[]","\<cr>", a:text, "end", "\<cr>"]
  else
    return [a:text]
  endif
endfunction
"nvim-tree
nmap <space>e :NvimTreeToggle<CR>
"coc
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gk :call <SID>show_documentation()<CR>
au BufWrite *.py call CocActionAsync('format')
"fish formatter
augroup autoformat_settings
  autocmd FileType fish AutoFormatBuffer fish_indent
augroup END
