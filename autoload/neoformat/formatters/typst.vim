function! neoformat#formatters#typst#enabled() abort
    return ['typstfmt', 'typstyle']
endfunction

function! neoformat#formatters#typst#typstfmt() abort
    return {
        \ 'exe': 'typstfmt',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#typst#typstyle() abort
    return {
        \ 'exe': 'typstyle',
        \ 'stdin': 1,
        \ }
endfunction
