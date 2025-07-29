function! neoformat#formatters#kdl#enabled() abort
    return ['kdlfmt']
endfunction

function! neoformat#formatters#kdl#kdlfmt() abort
    return {
        \ 'exe': 'kdlfmt',
        \ 'stdin': 1,
        \ 'args': ['format', '--stdin']
        \ }
endfunction
