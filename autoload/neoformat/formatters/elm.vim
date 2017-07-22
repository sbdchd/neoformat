function! neoformat#formatters#elm#enabled() abort
    return ['elmformat']
endfunction

function! neoformat#formatters#elm#elmformat() abort
    return {
        \ 'exe': 'elm-format',
        \ 'args': ['--stdin'],
        \ 'stdin': 1,
        \ }
endfunction
