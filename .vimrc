" Separate config files
source $HOME/.vim/init/mappings.vim
source $HOME/.vim/init/settings.vim
source $HOME/.vim/init/commands.vim

" *** Essentials ***
autocmd! bufwritepost .vimrc source %    " Automatically load .vimrc on save
syntax on
set nocompatible
set showcmd
set clipboard=
set autoread
set number
set relativenumber
set numberwidth=5

" Navigation
set scrolloff=1
set sidescrolloff=10

" Searching
set ignorecase
set smartcase
set wildmode=full 		       " the CR key to validate."
set path+=**
set incsearch
set hlsearch

" % on if to jump to else
runtime macros/matchit.vim

" Line highlight on normal mode
:set cul
:autocmd InsertEnter,InsertLeave * set cul!

" Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
function Tab(num) 
    let &tabstop=a:num
    let &shiftwidth=a:num
endfunction

" Insert Mode automatic comments
set formatoptions-=cro

" Window Management
set splitbelow
set splitright

" Wrap management
set showbreak=﬌

" *** Filetypes ***
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" *** Commands ***
command LC call commands#ListCommands()
command Wrap call commands#ToggleWrap()

" ***MAPPINGS***
" Essentials
set ttimeoutlen=300
let mapleader = " "
inoremap <silent> jk <Esc>
inoremap <silent> JK <Esc>

" Saving
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>r :source %<CR>


" Cut and pasting to system clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" x should delete to null register
nnoremap x "_x

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autoindent Move
nnoremap <silent> <leader>= :call mappings#AlignIndent()<CR>




" *** INSERTMODE ***
" auto-expanding
inoremap (<Tab>    ()<left>
inoremap (;        ();<left><left>
inoremap (,        (),<left><left>

inoremap [<Tab>    []<left>
inoremap [;        [];<left><left>
inoremap [,        [],<left><left>

inoremap '<Tab>    ''<left>
inoremap ';        '';<left><left>
inoremap ',        '',<left><left>

inoremap "<Tab>    ""<left>
inoremap ";        "";<left><left>
inoremap ",        "",<left><left>

inoremap <<Tab>    <><left>
inoremap <;        <>;<left><left>
inoremap <,        <>,<left><left>

inoremap {<Tab>    {}<left>
inoremap {;        {};<left><left>
inoremap {,        {},<left><left>

inoremap `<Tab>    ``<left>
inoremap `;        ``;<left><left>
inoremap `,        ``,<left><left>

" mapping for creating a 'code block'
inoremap <silent> \<CR> <c-o>:call mappings#CreateBlock()<cr>

" ***OBJECTS***
" Entire line
onoremap il :call mappings#SelectLine(1, v:count)<CR>
onoremap al :call mappings#SelectLine(0, v:count)<CR>

" ENTIRE FILE OBJECT
xnoremap ae ggog$
onoremap ae :normal vae<CR>
xnoremap ie ggoG$
onoremap ie :normal vie<CR>

" *** Aesthetics ***
" Insert Mode visual helpers
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Color Scheme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	set t_ut=
endif

" Basic text editing
set backspace=indent,eol,start " Proper backspace behavior.]

" UI
set laststatus=2
set wildmenu                   " Great command-line completion, use <Tab> to move around and 
