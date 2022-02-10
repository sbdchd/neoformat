function! neoformat#formatters#ruby#enabled() abort
   return ['rufo', 'rubybeautify', 'standard', 'rubocop', 'prettier']
endfunction

function! neoformat#formatters#ruby#rufo() abort
     return {
        \ 'exe': 'rufo',
        \ 'stdin': 1,
        \ 'valid_exit_codes': [0, 3]
        \ }
endfunction

function! neoformat#formatters#ruby#rubybeautify() abort
     return {
        \ 'exe': 'ruby-beautify',
        \ 'args': ['--spaces', '-c ' . shiftwidth()],
        \ }
endfunction

let s:clean_output = "awk '/^====================$/{p++;if(p==1){next}}p'"

function! neoformat#formatters#ruby#rubocop() abort
     return {
        \ 'exe': 'rubocop',
        \ 'args': ['--auto-correct', '--stdin', '"%:p"', '2>/dev/null', '|', s:clean_output],
        \ 'stdin': 1,
        \ 'stderr': 1
        \ }
endfunction

function! neoformat#formatters#ruby#standard() abort
     return {
        \ 'exe': 'standardrb',
        \ 'args': ['--fix', '--stdin', '"%:p"', '2>/dev/null', '|', s:clean_output],
        \ 'stdin': 1,
        \ 'stderr': 1
        \ }
endfunction

function! neoformat#formatters#ruby#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction
