function! neoformat#formatters#d2#enabled() abort
    return ['d2fmt']
endfunction

function! neoformat#formatters#d2#d2fmt() abort
    return {
        \ 'exe': 'd2',
        \ 'args': ['fmt','-'],
        \ 'stdin': 1,
        \ }
endfunction
