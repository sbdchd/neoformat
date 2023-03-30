function! neoformat#formatters#fennel#enabled() abort
  return ['fnlfmt']
endfunction

function! neoformat#formatters#fennel#fnlfmt() abort
  return {
        \ 'exe': 'fnlfmt',
        \ 'args': ['--fix'],
        \ 'replace': 1
        \ }
endfunction
