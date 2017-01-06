function! neoformat#formatters#haskell#enabled() abort
    return ['hindent', 'stylishhaskell']
endfunction

function! neoformat#formatters#haskell#hindent() abort
    return {
        \ 'exe' : 'hindent',
        \ 'args': ['--indent-size=2', '--line-length=80'],
        \ 'stdin' : 1,
        \ }
endfunction

function! neoformat#formatters#haskell#stylishhaskell() abort
    return {
        \ 'exe': 'stylish-haskell',
        \ 'stdin': 1,
        \ }
endfunction
