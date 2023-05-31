function! neoformat#formatters#openscad#enabled() abort
return ['openscadformat']
endfunction

function! neoformat#formatters#openscad#openscadformat() abort
return {
    \ 'exe': 'openscad-format',
    \ 'args': ['-d'],
    \ 'stdin': 1
    \ }
endfunction
