function! neoformat#formatters#vue#enabled() abort
    return ['prettier']
endfunction

function! neoformat#formatters#vue#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--parser', 'vue'],
        \ 'stdin': 1
        \ }
endfunction
