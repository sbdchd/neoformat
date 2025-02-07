function! neoformat#formatters#css#enabled() abort
    return ['stylelint', 'stylefmt', 'prettierd', 'prettier', 'cssbeautify', 'prettydiff', 'csscomb', 'topiary']
endfunction

function! neoformat#formatters#css#cssbeautify() abort
    return {
            \ 'exe': 'css-beautify',
            \ 'args': ['--indent-size ' .shiftwidth()],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#css#csscomb() abort
    return {
            \ 'exe': 'csscomb',
            \ 'replace': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

function! neoformat#formatters#css#prettydiff() abort
    return {
            \ 'exe': 'prettydiff',
            \ 'args': ['mode:"beautify"',
                     \ 'lang:"css"',
                     \ 'insize:' .shiftwidth(),
                     \ 'readmethod:"filescreen"',
                     \ 'endquietly:"quiet"',
                     \ 'source:"%:p"'],
            \ 'no_append': 1
            \ }
endfunction

function! neoformat#formatters#css#stylefmt() abort
    return {
        \ 'exe': 'stylefmt',
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#css#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'css'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#css#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#css#stylelint() abort
    return {
            \ 'exe': 'stylelint',
            \ 'args': ['--fix', '--stdin-filename', '"%:t"'],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

function! neoformat#formatters#json#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'no_append': 1,
        \ 'stdin': 1,
        \ 'args': ['format', '--merge-configuration', '--language', '"css"' ]
        \ }
endfunction
