function! neoformat#formatters#java#enabled() abort
   return ['uncrustify', 'astyle', 'clang-format']
endfunction

function! neoformat#formatters#java#uncrustify() abort
     return {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l JAVA', '-f'],
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
            \ 'stdin': 1,
            \ }
endfunction


