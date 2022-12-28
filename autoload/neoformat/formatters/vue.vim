function! neoformat#formatters#vue#enabled() abort
    return ['prettierd', 'prettier']
endfunction

function! neoformat#formatters#vue#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'vue'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#vue#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction
