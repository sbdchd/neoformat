function! neoformat#formatters#hcl#enabled() abort
    return ['hclfmt']
endfunction

function! neoformat#formatters#hcl#hclfmt() abort
    return {
        \ 'exe': 'hclfmt',
        \ 'stdin': 1
        \ }
endfunction
