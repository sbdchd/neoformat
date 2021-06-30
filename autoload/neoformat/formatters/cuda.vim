function! neoformat#formatters#cuda#enabled() abort
   return ['clangformat']
endfunction

function! neoformat#formatters#cuda#clangformat() abort
    return neoformat#formatters#c#clangformat()
endfunction

