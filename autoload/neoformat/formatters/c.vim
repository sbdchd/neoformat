function! neoformat#formatters#c#enabled() abort
   return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#c#uncrustify() abort
    return {
           \ 'exe': 'uncrustify',
           \ 'args': ['-q', '-l C'],
           \ 'stdin': 1,
           \ }
endfunction

function! neoformat#formatters#c#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#c#astyle() abort
    return {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c'],
            \ 'stdin': 1,
            \ }
endfunction
