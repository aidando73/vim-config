" Self-made helpers
" Generates tab following expandtab
function helper#GenerateTab()
    let indent = ""
    if &expandtab
        let i = &tabstop
        while i > 0
            let indent = indent . " "
            let i -= 1
        endwhile
    else
        let indent = "\t"
    endif
    return indent
endf

" Generates tabs following tabstop and expand tab 
function helper#GenerateIndent(num)
    let i = a:num/&tabstop
    let indent = ""
    while i > 0
        let indent = indent . helper#GenerateTab()
        let i -= 1
    endwhile

    return indent
endf
