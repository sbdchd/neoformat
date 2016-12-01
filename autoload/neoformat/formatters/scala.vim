function! neoformat#formatters#scala#enabled() abort
    return ['scalariform']
endfunction

function! neoformat#formatters#scala#scalariform() abort
    return {
        \ 'exe': 'scalariform',
        \ 'args': ['--stdout']
        \ }
endfunction
