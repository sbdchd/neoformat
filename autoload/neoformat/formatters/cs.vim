function! neoformat#formatters#cs#enabled() abort
    return ['uncrustify', 'astyle', 'clangformat', 'csharpier']
endfunction

function! neoformat#formatters#cs#uncrustify() abort
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l CS'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#cs#astyle() abort
    return {
        \ 'exe': 'astyle',
        \ 'args': ['--mode=cs'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#cs#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=' . expand('%:t')],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#cs#csharpier() abort
    return {
        \ 'exe': 'dotnet',
        \ 'args': ['csharpier', 'format'],
        \ 'stdin': 1,
        \ }
endfunction
