function! neoformat#formatters#tex#enabled() abort
    return ['latexindent']
endfunction

function! neoformat#formatters#tex#latexindent() abort
    return {
        \ 'exe': 'latexindent',
        \ 'args': ['-l', '-w'],
        \ 'stdin': 0,
        \ 'replace': 1
        \ }
endfunction
