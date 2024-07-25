function! neoformat#formatters#eruby#enabled() abort
    return ['htmlbeautifier']
endfunction

function! neoformat#formatters#eruby#htmlbeautifier() abort
    return {
        \ 'exe': 'htmlbeautifier',
        \ 'args': ['--keep-blank-lines', '1'],
        \ 'stdin': 1
        \ }
endfunction
