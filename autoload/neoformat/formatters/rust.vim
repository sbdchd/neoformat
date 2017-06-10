function! neoformat#formatters#rust#enabled() abort
    return ['rustfmt', 'cargo']
endfunction

function! neoformat#formatters#rust#rustfmt() abort
    return {
        \ 'exe': 'rustfmt',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#rust#cargo() abort
    return {
        \ 'exe': 'cargo',
        \ 'args': ['fmt'],
        \ 'replace': 1,
        \ 'stdin': 1,
        \ }
endfunction
