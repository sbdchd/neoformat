function! neoformat#formatters#rust#enabled() abort
    return ['rustfmt', 'topiary']
endfunction

function! neoformat#formatters#rust#rustfmt() abort
    return {
        \ 'exe': 'rustfmt',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#rust#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'stdin': 1,
        \ 'args': ['format', '--merge-configuration', '--language', '"rust"' ]
        \ }
endfunction
