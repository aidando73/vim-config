" Essentials
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

