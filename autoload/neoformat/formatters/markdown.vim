function! neoformat#formatters#markdown#enabled() abort
   return ['remark', 'prettierd', 'prettier', 'denofmt', 'mdformat']
endfunction

function! neoformat#formatters#markdown#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#markdown#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#markdown#remark() abort
    return {
            \ 'exe': 'remark',
            \ 'args': ['--no-color', '--silent'],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

function! neoformat#formatters#markdown#denofmt() abort
    return {
        \ 'exe': 'deno',
        \ 'args': ['fmt', '--ext', 'md', '-'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#markdown#mdformat() abort
    return {
        \ 'exe': 'mdformat',
        \ 'args': ['-'],
        \ 'stdin': 1,
        \ }
endfunction
