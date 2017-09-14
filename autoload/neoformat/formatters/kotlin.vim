function! neoformat#formatters#kotlin#enabled() abort
    return ['ktlint']
endfunction

function! neoformat#formatters#kotlin#ktlint() abort
    return {
            \ 'exe': 'ktlint',
            \ 'args': ['-F'],
            \ 'replace': 1,
            \ }
endfunction
