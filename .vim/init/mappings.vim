autocmd! bufwritepost mappings.vim source %    " Automatically load .vimrc on save
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


" ***OBJECTS***
" Entire line
onoremap il :call mappings#SelectLine(1, v:count)<CR>
onoremap al :call mappings#SelectLine(0, v:count)<CR>

" ENTIRE FILE OBJECT
xnoremap ae ggog$
onoremap ae :normal vae<CR>
xnoremap ie ggoG$
onoremap ie :normal vie<CR>
