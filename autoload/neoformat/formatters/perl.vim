function! neoformat#formatters#perl#enabled() abort
   return ['perltidy', 'perlimports']
endfunction

function! neoformat#formatters#perl#perltidy() abort
    return {
            \ 'exe': 'perltidy',
            \ 'args': ['-q'],
            \ 'stdin': 1,
            \ }
endfunction

function! neoformat#formatters#perl#perlimports() abort
    return {
            \ 'exe': 'perlimports',
            \ 'args': ['--read-stdin', '--filename', '%:p'],
            \ 'stdin': 1,
            \ 'no_append': 1,
            \ }
endfunction
