function! neoformat#formatters#haskell#enabled() abort
    return ['hindent', 'stylishhaskell', 'hfmt', 'brittany', 'sortimports', 'floskell']
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

function! neoformat#formatters#haskell#sortimports() abort
    return {
        \ 'exe': 'sort-imports',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#haskell#floskell() abort
    return {
        \ 'exe': 'floskell',
        \ 'stdin': 1,
        \ }
endfunction
