function! neoformat#formatters#ruby#enabled() abort
   return ['rubybeautify', 'rubocop']
endfunction

function! neoformat#formatters#ruby#rubybeautify() abort
     return {
        \ 'exe': 'ruby-beautify',
        \ 'args': ['--spaces', '-c ' . shiftwidth()],
        \ }
endfunction

function! neoformat#formatters#ruby#rubocop() abort
     return {
        \ 'exe': 'rubocop',
        \ 'args': ['--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', 'sed "1,/^====================$/d"'],
        \ 'stdin': 1,
        \ }
endfunction
