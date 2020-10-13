" Toggle Wrapping
function commands#ToggleWrap()
    if &wrap == 0
        let &wrap = 1
    else
        let &wrap = 0
    endif
endf

function commands#ListCommands()
    echom "Wrap     => Toggles wrap setting."
endf
