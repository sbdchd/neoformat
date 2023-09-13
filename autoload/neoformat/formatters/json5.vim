function! neoformat#formatters#json5#enabled() abort
    return ['prettierd', 'prettier']
endfunction

function! neoformat#formatters#json5#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#json5#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

