autocmd! bufwritepost plugins.vim source %    " Automatically load .vimrc on save
" ***PLUGINS***
call plug#begin()
    " Lightline
    Plug 'itchyny/lightline.vim'
    " Operators and objects
    Plug 'tpope/vim-surround' " ys ds cs
    Plug 'tpope/vim-commentary' " gc
    Plug 'vim-scripts/ReplaceWithRegister' " gr
    Plug 'michaeljsmith/vim-indent-object' " ii ai iI aI
    " Smooth Scrolling
    Plug 'psliwka/vim-smoothie'
    " vim-enuch? vim surroun

    " Niceties
    " Autocompletion and Snippets engine. With LSP support. requires nvim >= 0.4.3 && nodejs >= 10.12
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " ALE - Asynchronous error engine
    Plug 'dense-analysis/ale'
    
    
    " File Navigation 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'

call plug#end()

" Lightline config
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ]
  \            ]
  \ }
  \ }

" NERD Tree
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapActivateNode='l'
let NERDTreeQuitOnOpen = 1
map <C-n> :NERDTreeToggle<CR>

" Coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


