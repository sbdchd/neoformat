function! neoformat#formatters#jsonnet#enabled() abort
    return ['jsonnetfmt']
endfunction

function! neoformat#formatters#jsonnet#jsonnetfmt() abort
    return {
        \ 'exe': 'jsonnetfmt',
        \ 'args': ['-'],
        \ 'stdin': 1,
        \ }
endfunction
