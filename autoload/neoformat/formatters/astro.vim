function! neoformat#formatters#astro#enabled() abort
    return ['prettier']
endfunction

function! neoformat#formatters#astro#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction
