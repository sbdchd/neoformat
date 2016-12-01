function! neoformat#formatters#json#enabled() abort
    return ['jsbeautify', 'prettydiff']
endfunction

function! neoformat#formatters#json#jsbeautify() abort
    return neoformat#javascript#jsbeautify()
endfunction

function! neoformat#formatters#json#prettydiff() abort
    return neoformat#javascript#prettydiff()
endfunction
