function! neoformat#formatters#xml#enabled() abort
   return ['tidy', 'prettydiff']
endfunction

function! neoformat#formatters#xml#tidy() abort
    return {
            \ 'exe': 'tidy',
            \ 'args': ['-quiet',
            \          '-xml',
            \          '--indent auto',
            \          '--indent-spaces 4',
            \          '--vertical-space yes',
            \          '--tidy-mark no'
            \         ]
            \ }
endfunction

function! neoformat#formatters#xml#prettydiff() abort
    return neoformat#formatters#html#prettydiff()
endfunction
