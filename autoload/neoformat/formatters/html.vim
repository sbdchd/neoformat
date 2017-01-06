function! neoformat#formatters#html#enabled() abort
    return ['htmlbeautify', 'tidy', 'prettydiff']
endfunction

function! neoformat#formatters#html#tidy() abort
    return {
        \ 'exe': 'tidy',
        \ 'args': ['-quiet',
        \          '--indent auto',
        \          '--indent-spaces 4',
        \          '--vertical-space yes',
        \          '--tidy-mark no'
        \         ]
        \ }
endfunction

function! neoformat#formatters#html#htmlbeautify() abort
    return {
            \ 'exe': 'html-beautify',
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#html#prettydiff() abort
    return {
        \ 'exe': 'prettydiff',
        \ 'args': ['mode:"beautify"',
                 \ 'lang:"html"',
                 \ 'readmethod:"filescreen"',
                 \ 'endquietly:"quiet"',
                 \ 'source:"%:p"'],
        \ 'no_append': 1
        \ }
endfunction
