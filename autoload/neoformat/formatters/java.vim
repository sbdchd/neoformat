function! neoformat#formatters#java#enabled() abort
   return ['uncrustify', 'astyle', 'clangformat']
endfunction

function! neoformat#formatters#java#uncrustify() abort
     return {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l JAVA'],
            \ 'stdin': 1,
            \ }
endfunction


function! neoformat#formatters#java#astyle() abort
    return {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=java'],
            \ 'stdin': 1,
            \ }
endfunction


function! neoformat#formatters#java#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=' . expand('%:t')],
            \ 'stdin': 1,
            \ }
endfunction


