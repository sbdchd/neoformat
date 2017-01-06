function! neoformat#formatters#typescript#enabled() abort
   return ['tsfmt']
endfunction

function! neoformat#formatters#typescript#tsfmt() abort
    return {
        \ 'exe': 'tsfmt',
        \ 'args': ['--stdin'],
        \ 'stdin': 1
        \ }
endfunction
