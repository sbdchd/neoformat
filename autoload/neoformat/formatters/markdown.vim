function! neoformat#formatters#markdown#enabled() abort
   return ['remark']
endfunction

function! neoformat#formatters#markdown#remark() abort
    return {
            \ 'exe': 'remark',
            \ 'args': ['--no-color', '--silent'],
            \ 'stdin': 1
            \ }
endfunction
