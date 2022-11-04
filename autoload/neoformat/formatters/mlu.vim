function! neoformat#formatters#mlu#enabled() abort
   return ['clangformat']
endfunction

function! neoformat#formatters#mlu#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=file'],
            \ 'stdin': 1,
            \ }
endfunction
