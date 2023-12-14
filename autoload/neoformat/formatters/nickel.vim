function! neoformat#formatters#nickel#enabled() abort
    return ['topiary']
endfunction

function! neoformat#formatters#nickel#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'stdin': 1,
        \ 'args': ['format', '--language', '"nickel"' ]
        \ }
endfunction
