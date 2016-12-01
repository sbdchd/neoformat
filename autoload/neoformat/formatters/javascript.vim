function! neoformat#formatters#javascript#enabled() abort
    return ['jsbeautify', 'prettydiff', 'clangformat', 'esformatter']
endfunction

function! neoformat#formatters#javascript#jsbeautify() abort
    return {'exe': 'js-beautify'}
endfunction

function! neoformat#formatters#javascript#clangformat() abort
    return {'exe': 'clang-format'}
endfunction

function! neoformat#formatters#javascript#prettydiff() abort
    return {
        \ 'exe': 'prettydiff',
        \ 'args': ['mode:"beautify"',
                 \ 'lang:"javascript"',
                 \ 'readmethod:"filescreen"',
                 \ 'endquietly:"quiet"',
                 \ 'source:"%:p"'],
        \ 'no_append': 1
        \ }
endfunction

function! neoformat#formatters#javascript#esformatter() abort
    return {
        \ 'exe': 'esformatter'
        \ }
endfunction
