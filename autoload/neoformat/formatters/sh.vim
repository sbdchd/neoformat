function! neoformat#formatters#sh#enabled() abort
    return ['shfmt', 'topiary']
endfunction

function! neoformat#formatters#sh#shfmt() abort
    let opts = neoformat#utils#var_default('shfmt_opt', '')
    return {
            \ 'exe': 'shfmt',
            \ 'args': ['-i ' . (&expandtab ? shiftwidth() : 0), opts],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#sh#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'stdin': 1,
        \ 'args': ['format', '--merge-configuration', '--language', '"bash"' ]
        \ }
endfunction
