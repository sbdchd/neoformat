function! neoformat#formatters#xhtml#enabled() abort
   return ['tidy', 'prettydiff']
endfunction

function! neoformat#formatters#xhtml#tidy() abort
    return {
            \ 'exe': 'tidy',
            \ 'args': ['-quiet',
            \          '-asxhtml',
            \          '--indent auto',
            \          '--indent-spaces 4',
            \          '--vertical-space yes',
            \          '--tidy-mark no'
            \         ],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#xhtml#prettydiff() abort
    return neoformat#formatters#html#prettydiff()
endfunction
