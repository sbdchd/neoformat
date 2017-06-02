function! neoformat#formatters#typescript#enabled() abort
   return ['tsfmt', 'prettier']
endfunction

function! neoformat#formatters#typescript#tsfmt() abort
    return {
        \ 'exe': 'tsfmt',
        \ 'args': ['--stdin', '%:p'],
        \ 'stdin': 1
        \ }
endfunction

function! neoformat#formatters#typescript#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--parser', 'typescript'],
        \ 'stdin': 1
        \ }
endfunction
