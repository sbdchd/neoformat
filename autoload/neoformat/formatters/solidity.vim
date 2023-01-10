function! neoformat#formatters#solidity#enabled() abort
    return ['forge', 'prettierd', 'prettier']
endfunction

function! neoformat#formatters#solidity#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#solidity#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#solidity#forge() abort
    return {
        \ 'exe': 'forge',
        \ 'args': ['fmt', '--raw', '-'],
        \ 'stdin': 1
        \ }
endfunction
