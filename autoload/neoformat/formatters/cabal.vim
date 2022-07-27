function! neoformat#formatters#cabal#enabled() abort
    return ['cabalfmt']
endfunction

function! neoformat#formatters#cabal#cabalfmt() abort
    return {
        \ 'exe' : 'cabal-fmt',
        \ 'args' : ["%:p"],
        \ 'no_append': 1,
        \ }
endfunction
