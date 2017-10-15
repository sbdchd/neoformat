function! neoformat#formatters#yaml#enabled() abort
   return ['pyaml']
endfunction

function! neoformat#formatters#yaml#pandoc() abort
   return {
            \ 'exe': 'python3',
            \ 'args': ['-m', 'pyaml'],
            \ 'stdin': 1,
            \ }
endfunction

