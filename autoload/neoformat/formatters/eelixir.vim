function! neoformat#formatters#eelixir#enabled() abort
    return ['mixformat']
endfunction

function! neoformat#formatters#eelixir#mixformat() abort
    return {
        \ 'exe': 'mix',
        \ 'args': ['format', '--stdin-filename="%:t"', '-'],
        \ 'stdin': 1
        \ }
endfunction
