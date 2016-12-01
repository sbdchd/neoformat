function! neoformat#formatters#elm#enabled() abort
    return ['elmformat']
endfunction

function! neoformat#formatters#elm#elmformat() abort
    return {
        \ 'exe': 'elm-format'
        \ }
endfunction


