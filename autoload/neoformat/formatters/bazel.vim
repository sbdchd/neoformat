function! neoformat#formatters#bazel#enabled() abort
    return ['buildifier']
endfunction

function! neoformat#formatters#bazel#buildifier() abort
    return {
        \ 'exe': 'buildifier',
        \ 'stdin': 1
        \ }
endfunction
