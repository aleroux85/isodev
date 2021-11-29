syntax on
set number relativenumber
set scrolloff=10
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=/.vim/undodir
set undofile
set incsearch
set nohlsearch
set hidden

set signcolumn=yes
set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=lightgrey

set matchpairs+=<:>

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=NONE
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let mapleader = " "
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 40<CR>
nnoremap <Leader>; :
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

runtime plugin/dragvisuals.vim
vmap  <expr>  <C-h>        DVB_Drag('left')
vmap  <expr>  <C-l>        DVB_Drag('right')
vmap  <expr>  <C-j>        DVB_Drag('down')
vmap  <expr>  <C-k>        DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gl :Git pull<CR>
nnoremap <leader>gc :Git checkout<CR>
