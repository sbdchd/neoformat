function! neoformat#formatters#xml#enabled() abort
   return ['tidy', 'prettydiff', 'prettierd', 'prettier', 'xmllint']
endfunction

function! neoformat#formatters#xml#tidy() abort
    return {
            \ 'exe': 'tidy',
            \ 'args': ['-quiet',
            \          '-xml',
            \          '--indent auto',
            \          '--indent-spaces ' . shiftwidth(),
            \          '--vertical-space yes',
            \          '--tidy-mark no'
            \         ],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

function! neoformat#formatters#xml#prettydiff() abort
    return neoformat#formatters#html#prettydiff()
endfunction

function! neoformat#formatters#xml#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#xml#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#xml#xmllint() abort
    return {
        \ 'exe': 'xmllint',
        \ 'args': ['--format', '--quiet', '-'],
        \ 'stdin': 1,
        \ }
endfunction
