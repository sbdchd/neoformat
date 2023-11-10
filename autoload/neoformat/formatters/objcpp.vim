function! neoformat#formatters#objcpp#enabled() abort
    return ['uncrustify', 'clangformat', 'astyle']
endfunction

function! neoformat#formatters#objcpp#uncrustify() abort
    return {
        \ 'exe': 'uncrustify',
        \ 'args': ['-q', '-l OC+'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#objcpp#clangformat() abort
    return neoformat#formatters#c#clangformat()
endfunction

function! neoformat#formatters#objcpp#astyle() abort
    return neoformat#formatters#c#astyle()
endfunction

