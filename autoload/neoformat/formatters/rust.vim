function! neoformat#formatters#rust#enabled() abort
    return ['rustfmt']
endfunction

function! neoformat#formatters#rust#rustfmt() abort
    return {
        \ 'exe': 'rustfmt',
        \ 'replace': 1
        \ }
endfunction
