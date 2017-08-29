function! neoformat#formatters#graphql#enabled() abort
    return ['prettier']
endfunction

function! neoformat#formatters#graphql#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--parser', 'graphql'],
        \ 'stdin': 1
        \ }
endfunction
