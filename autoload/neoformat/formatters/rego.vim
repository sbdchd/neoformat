function! neoformat#formatters#rego#enabled() abort
    return ['opafmt']
endfunction

function! neoformat#formatters#rego#opafmt() abort
    return {
        \ 'exe': 'opa',
        \ 'args': ['fmt'],
        \ 'stdin': 1,
        \ }
endfunction
