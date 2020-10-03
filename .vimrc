" Separate config files
source $HOME/.vim/init/filetypes.vim
source $HOME/.vim/init/mappings.vim
source $HOME/.vim/init/settings.vim
source $HOME/.vim/init/commands.vim

autocmd! bufwritepost .vimrc source %    " Automatically load .vimrc on save
" Commands not on by default in nvim
syntax on
set nocompatible
set showcmd
set clipboard=unnamed
set autoread

" Insert Mode visual helpers
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Aesthetics
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
