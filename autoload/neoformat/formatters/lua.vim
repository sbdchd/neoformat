function! neoformat#formatters#lua#enabled() abort
    return ['luaformatter']
endfunction

function! neoformat#formatters#lua#luaformatter() abort
    return {
        \ 'exe': 'luaformatter'
        \ }
endfunction
