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
    Plug 'bkad/CamelCaseMotion'
    Plug 'justinmk/vim-sneak'
    " Smooth Scrolling
    Plug 'psliwka/vim-smoothie'
    " vim-enuch? vim surroun

    " Niceties
    " Autocompletion and Snippets engine. With LSP support. requires nvim >= 0.4.3 && nodejs >= 10.12
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " coc-snippets => sudo pip2 install --upgrade pynvim 
        " coc-eslint => sudo npm install -g eslint && eslint --init && npm init
    
    
    " File Navigation 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vifm/vifm.vim'
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
set noshowmode

" Sneak Rebinding
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
" visual-mode
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
" operator-pending-mode
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

" Camel Case Motion
let g:camelcasemotion_key = '\'

" NERD Tree
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapActivateNode='l'
let NERDTreeQuitOnOpen = 1
"map <C-n> :NERDTreeToggle<CR>
map <c-n> :EditVifm .<CR>


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

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



imap <c-l> <plug>(coc-snippets-expand-jump)

"Rip Grep
"" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"FZF 
nnoremap <leader>f :FZF<CR>
