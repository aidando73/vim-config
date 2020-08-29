" Plugins 

" Call :PlugInstall to install all plugins
call plug#begin('~/.vim/plugged')
    " Line below
	Plug 'itchyny/lightline.vim'
    
    " HTML and Vim snippets
    Plug 'mattn/emmet-vim'
    
    " Nerd Tree
    Plug 'preservim/nerdtree'
    
    " Syntax checker
    Plug 'vim-syntastic/syntastic'
    
    " Snippets
    Plug 'SirVer/ultisnips'
    " Make sure ./vim/Ultisnips has snippets
    " vim-snippets has a good collection

    " AutoCompletion
    Plug 'ycm-core/YouCompleteMe'
    
    " Operators
    Plug 'tpope/vim-surround' " ys ds cs
    Plug 'tpope/vim-commentary' " gc
    Plug 'vim-scripts/ReplaceWithRegister' " gr
    
call plug#end()

" Gvim
set guifont=FiraCode\ 15
" set guioptions -=m
" set guioptions -=T
" set guioptions -=r
" set guioptions -=L
" set guioptions -=e
" vimdows

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2

" NERD Tree
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
nnoremap <c-a> :Errors<CR>

let g:syntastic_cpp_checkers=['gcc']

" UltiSnippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-h>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
let g:UltiSnipsEditSplit="vertical"


" YouCompleteMe
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_show_diagnostics_ui = 0


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
autocmd! bufwritepost .vimrc source %    " Automatically load .vimrc on save


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


" Cut and pasting
nnoremap d "_d
nnoremap x "_x
nnoremap <leader>d d
nnoremap <leader>D "+d
nnoremap <leader>P "+p


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
"let g:airline_powerline_fonts = 1
" Light line plugin
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ]
      \            ]
      \ }
      \ }
" Basic text editing
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.]
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
" Insert mode editing
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
inoremap <c-b> <c-w>
inoremap <c-w> <Esc>:call I_DeleteWord()<CR>
function! I_DeleteWord()
	let col = getcurpos()[2]
	if col == 1
		exe "norm!dw"
	else
		exe "norm!ldw"
	end
	exe "startinsert"
endfunction
inoremap <c-l> <del>
inoremap <CR> <CR>z<BS>
" Make sure indents aren't removed on exiting insertion
nnoremap o oz<BS>
nnoremap O Oz<BS>

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
" INDENT TEXT OBJECT
onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

set tw=0
function! s:IndTxtObj(inner)
	let curline = line(".")
	let lastline = line("$")
	let i = indent(curline) - &shiftwidth * (v:count1 - 1)
	let i = i < 0 ? 0 : i
    
    " Should do nothing if no indent
    if indent(curline) == 0
        return
    endif
    
	if getline(".") !~ "^\\s*$"  "(empty line)
		" Moves cursor to start of the indent 
		let p = curline - 1
		let nextblank = getline(p) =~ "^\\s*$"
		while p > 0 && ((i == 0 && (getline(p) !~ "^\\S")) || (i > 0 && (indent(p) >= i || nextblank)))
			normal! -
			let p = line(".") - 1
			let nextblank = getline(p) =~ "^\\s*$"
		endwhile
		if !a:inner
			normal! -
		endif
		normal! V
		
		" Moves cursor to end of the indent
		call cursor(curline, 0)
		let p = line(".") + 1
		let nextblank = getline(p) =~ "^\\s*$"
		while p <= lastline && ((i == 0 && (getline(p) !~ "^\\S")) || (i > 0 && (indent(p) >= i || nextblank)))
		  	normal! +
		    let p = line(".") + 1
			let nextblank = getline(p) =~ "^\\s*$"
		endwhile
		if &filetype !=# 'python' && !a:inner
			normal! +
		endif
	endif		
endfunction
	

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

" INDENT OPERATOR  (currently disabled)
let g:str = ''
nnoremap <silent> > :set opfunc=IndentOperator<BAR>norm!mZ<CR>:let g:str = ">"<CR>g@
nnoremap <silent> < :set opfunc=IndentOperator<BAR>norm!mZ<CR>:let g:str = "<"<CR>g@
function! IndentOperator(...)
	"Indent
	let sl = getpos("'[")[1]
	let el = getpos("']")[1]
	call cursor(sl, 1)
	norm! v
	call cursor(el, 1)
	exe "norm! ".g:str 
	
	" Return to original pos
	norm!`Z
	if g:str ==# '>'
		norm!l
	else
		norm!h
	endif
endfunction


