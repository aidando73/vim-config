" Vanilla Settings
" Essentials
autocmd! bufwritepost init.vim source %    " Automatically load .vimrc on save
set ttimeoutlen=300
let mapleader = " "
inoremap <silent> jk <Esc>
inoremap <silent> JK <Esc>
set number
set relativenumber
set numberwidth=5
" For Searching
set ignorecase
set smartcase
set scrolloff=1
set wildmode=full 		       " the CR key to validate."
set path+=**
" Saving
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
" % on if to jump to else
runtime macros/matchit.vim
:set cul
:autocmd InsertEnter,InsertLeave * set cul!
"Aesthetics
set termguicolors
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" colorscheme seoul256
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	set t_ut=
endif
" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
" File types
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2


" ***MAPPINGS***
" auto-expanding
inoremap (<Tab> (<CR>)<C-c>O<Tab>
inoremap (; (<CR>);<C-c>O<Tab>
inoremap (, (<CR>),<C-c>O<Tab>
inoremap {<Tab> {<CR>}<C-c>O<Tab>
inoremap {; {<CR>};<C-c>O<Tab>
inoremap {, {<CR>},<C-c>O<Tab>
inoremap [<Tab> [<CR>]<C-c>O<Tab>
inoremap [; [<CR>];<C-c>O<Tab>
inoremap [, [<CR>],<C-c>O<Tab>
" Cut and pasting to system clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y





" ***OBJECTS***
" Entire line
onoremap il :call SelectLine(1, v:count)<CR>
onoremap al :call SelectLine(0, v:count)<CR>
function! SelectLine(isinner, count)
    let lines = a:count - 1
    if a:isinner 
        "Inner line	
        if lines <= 0
            exe "norm!v^og_"
        else
            exe "norm!v^o".lines."jg_"
        endif
    else
        "Arounded line
        if lines <= 0
            exe "norm!V"
        else
            exe "norm!V".lines."j"
        endif
    end
endfunction
" ENTIRE FILE OBJECT
xnoremap ae ggog$
onoremap ae :normal vae<CR>
xnoremap ie ggoG$
onoremap ie :normal vie<CR>






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

    " Niceties
    " Autocompletion and Snippets engine. With LSP support. requires nvim >= 0.4.3 && nodejs >= 10.12
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " ALE - Asynchronous error engine
    "
    " vim-enuch? vim surroun
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

