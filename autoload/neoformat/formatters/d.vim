function! neoformat#formatters#d#enabled() abort
    return ['uncrustify', 'dfmt']
endfunction

function! neoformat#formatters#d#dfmt() abort
    return {
        \ 'exe': 'dfmt'
        \ }
endfunction

function! neoformat#formatters#d#uncrustify() abort
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l D', '-f']
        \ }
endfunction
