" Creates a new code block
function mappings#CreateBlock() 
    " Get information about the current line
    let cur_lnum = line(".")
    let cur_indent = indent(cur_lnum)
    let cur_line = getline(cur_lnum)
    let cur_col = getpos(".")[2]

    " Generate indent string for the line
    let indent_str = helper#GenerateIndent(cur_indent)

    " edit the lines surrounding cursor
    call append(cur_lnum, indent_str . cur_line[cur_col-1:strlen(cur_line)-1])
    call append(cur_lnum, indent_str . helper#GenerateTab())
    exe "norm!Dj$"
endf

" Idempotently aligns cursor at the corrent indent
function mappings#AlignIndent()
    if getline(".") =~ '\s*\S'
        exe "normal! =="
    else
        exe "normal! aa\<esc>==\"_x"
    endif
endf

" Motion for currentline
function! mappings#SelectLine(isinner, count)
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
    endif
endfunction

