function! neoformat#formatters#just#enabled() abort
    return ['just']
endfunction

function! neoformat#formatters#just#just() abort
    return {
        \ 'exe': 'just',
        \ 'args': ['--dump', '--justfile'],
        \ }
endfunction
