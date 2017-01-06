function! neoformat#formatters#perl#enabled() abort
   return ['perltidy']
endfunction

function! neoformat#formatters#perl#perltidy() abort
    return {
            \ 'exe': 'perltidy',
            \ 'stdin': 1,
            \ }
endfunction
