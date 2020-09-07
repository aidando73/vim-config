" ***PLUGINS***
call plug#begin()
    " ESSENTIALS
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
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ]
  \            ]
  \ }
  \ }

" NERD Tree
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

