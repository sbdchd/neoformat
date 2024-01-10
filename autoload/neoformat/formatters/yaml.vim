function! neoformat#formatters#yaml#enabled() abort
   return ['pyaml', 'prettierd', 'prettier', 'google_yamlfmt', 'yamlfmt', 'yamlfix']
endfunction

function! neoformat#formatters#yaml#pyaml() abort
   return {
            \ 'exe': 'python3',
            \ 'args': ['-m', 'pyaml'],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#yaml#prettier() abort
    return {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'yaml'],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

function! neoformat#formatters#yaml#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#yaml#google_yamlfmt() abort
    return {
        \ 'exe': 'yamlfmt',
        \ 'args': ['-'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#yaml#yamlfmt() abort
    return {
        \ 'exe': 'yamlfmt',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#yaml#yamlfix() abort
    return {
        \ 'exe': 'yamlfix',
        \ 'args': ['-'],
        \ 'stdin': 1,
        \ }
endfunction
