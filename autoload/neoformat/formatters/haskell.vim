function! neoformat#formatters#haskell#enabled() abort
    return ['hindent', 'stylishhaskell', 'hfmt', 'brittany']
endfunction

function! neoformat#formatters#haskell#hindent() abort
    return {
        \ 'exe' : 'hindent',
        \ 'args': ['--indent-size ' . shiftwidth()],
        \ 'stdin' : 1,
        \ }
endfunction

function! neoformat#formatters#haskell#stylishhaskell() abort
    return {
        \ 'exe': 'stylish-haskell',
        \ 'args': ['2>/dev/null'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#haskell#hfmt() abort
    return {
        \ 'exe': 'hfmt',
        \ 'args': ['-'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#haskell#brittany() abort
    return {
        \ 'exe': 'brittany',
        \ 'stdin': 1,
        \ }
endfunction
