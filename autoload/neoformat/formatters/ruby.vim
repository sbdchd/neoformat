function! neoformat#formatters#ruby#enabled() abort
   return ['rubybeautify']
endfunction

function! neoformat#formatters#ruby#rubybeautify() abort
     return {
        \ 'exe': 'ruby-beautify',
        \ 'args': ['--spaces', '-c 2']
        \ }
endfunction
