function! neoformat#formatters#less#enabled() abort
    return ['csscomb', 'prettydiff']
endfunction

function! neoformat#formatters#less#csscomb() abort
    return neoformat#formatters#css#csscomb()
endfunction

function! neoformat#formatters#less#prettydiff() abort
    return neoformat#formatters#css#prettydiff()
endfunction
