function! neoformat#formatters#nim#enabled() abort
    return ['nimpretty','nph']
endfunction

function! neoformat#formatters#nim#nph() abort
    return {
        \ 'exe': 'nph',
        \ 'replace': 1,
        \ }
endfunction

function! neoformat#formatters#nim#nimpretty() abort
    return {
        \ 'exe': 'nimpretty',
        \ 'args': ['--backup:off'],
        \ 'replace': 1,
        \ }
endfunction
