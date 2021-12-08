" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
let @x=':%s/</\r</g^M^[gg=G'
let @q='ctrl + r ctrl + r q'

function! NoNumbers()
    set invnumber
endfunc

function! CopyAll()
    :%y+
endfunc
