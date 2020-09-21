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
inoremap (<Tab> (<CR>)<C-c>O<tab>
inoremap (; (<CR>);<C-c>O<tab>
inoremap (, (<CR>),<C-c>O<tab>
inoremap {<Tab> {<CR>}<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [<Tab> [<CR>]<C-c>O<tab>
inoremap [; [<CR>];<C-c>O<tab>
inoremap [, [<CR>],<C-c>O<tab>

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
nnoremap <leader>= ia<esc>==x

" Insert Newline operator
nnoremap <leader>o m`o<esc>``
nnoremap <leader>O m`O<esc>``

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
