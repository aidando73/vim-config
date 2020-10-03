" List out all available commands
command LC call ListCommands()
function ListCommands()
    echom "Wrap     => Toggles wrap setting."
endf


" Toggle Wrapping
command Wrap call ToggleWrap()
function ToggleWrap()
    if &wrap == 0
        let &wrap = 1
    else
        let &wrap = 0
    endif
endf
