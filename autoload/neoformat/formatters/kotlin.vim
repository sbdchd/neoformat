function! neoformat#formatters#kotlin#enabled() abort
    return ['ktlint', 'prettierd', 'prettier']
endfunction

function! neoformat#formatters#kotlin#ktlint() abort
    return {
            \ 'exe': 'ktlint',
            \ 'args': ['-F'],
            \ 'replace': 1,
            \ }
endfunction

function! neoformat#formatters#kotlin#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#kotlin#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction
