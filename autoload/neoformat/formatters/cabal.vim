function! neoformat#formatters#cabal#enabled() abort
    return ['cabalfmt']
endfunction

function! neoformat#formatters#cabal#cabalfmt() abort
    return {
        \ 'args' : [expand('%:p')],
        \ 'exe' : 'cabal-fmt',
        \ 'no_append' : 1,
        \ 'stdin' : 0
        \ }
endfunction
