function! neoformat#formatters#c#enabled() abort
   return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#c#uncrustify() abort
    return {
           \ 'exe': 'uncrustify',
           \ 'args': ['-q', '-l C', '-f']
           \ }
endfunction

function! neoformat#formatters#c#clangformat() abort
    return {'exe': 'clang-format'}
endfunction

function! neoformat#formatters#c#astyle() abort
    return {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c'],
            \ 'replace': 1
            \ }
endfunction
