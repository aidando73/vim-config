" Plugins 
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2

" Essentials
set timeoutlen=300
let mapleader = " "
inoremap <silent> jk <Esc>
inoremap <silent> JK <Esc>

" Bare Basics
set nocompatible
set showcmd
syntax on
set number
set clipboard=unnamed
set relativenumber
set numberwidth=5
set ignorecase
set smartcase
set scrolloff=1
set autoread
autocmd! bufwritepost .vimrc source %    " Automatically load .vimrc on save

" auto-expanding
inoremap (<Tab> (<CR>)<C-c>O
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {<Tab> {<CR>}<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [<Tab> [<CR>]<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
set formatoptions-=cro


" Cut and pasting to system clipboard
nnoremap <leader>d "+d
vnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Autoindent Move
nnoremap <leader>= ia<esc>==x


" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim


" Insert Mode visual helpers
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

:set cul
:autocmd InsertEnter,InsertLeave * set cul!


" Aesthetics
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
"packadd! dracula
"let g:dracula_italic = 0
":colorscheme dracula
if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	set t_ut=
endif

" Basic text editing
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.]
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
" Insert mode editing
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" GUI
set laststatus=2
set wildmenu                   " Great command-line completion, use <Tab> to move around and 
set wildmode=full 		       " the CR key to validate."
set incsearch
set hlsearch
set path+=**

" Saving
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>


" Custom text objects
" ENTIRE LINE OBJECT
onoremap il :call SelectLine(1, v:count)<CR>
onoremap al :call SelectLine(0, v:count)<CR>
" Selects inner line according to count and arounded/inner
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



function! s:InputChar()
	let c = getchar()
	return type(c) == type(0) ? nr2char(c) : c
endfunction
